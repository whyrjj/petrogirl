package com.petrogirl.petrol.admin.shiro;

import com.petrogirl.petrol.common.entity.User;
import com.petrogirl.petrol.common.service.RoleService;
import com.petrogirl.petrol.common.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Set;

@Component
public class JpaRealm extends AuthorizingRealm {
	
	private static final Logger LOG = LoggerFactory.getLogger(JpaRealm.class);
	
	@Autowired
    UserService userService;
	
	@Autowired
    RoleService roleService;
    
    public JpaRealm() {
		super(new HashedCredentialsMatcher(Md5Hash.ALGORITHM_NAME));
	}

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
    	
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        String username = upToken.getUsername();
        LOG.debug("得到认证信息：" + username);
        // Null username is invalid
        if (username == null) {
            throw new AccountException("Null usernames are not allowed by this realm.");
        }

        SimpleAuthenticationInfo info = null;

        String password = null;
        String salt = null;
        String[] queryResults = getPasswordForUser(username);
        password = queryResults[0];
        salt = queryResults[1];

        if (password == null) {
            throw new UnknownAccountException("No account found for user [" + username + "]");
        }

        info = new SimpleAuthenticationInfo(username, password.toCharArray(), getName());
        
        if (salt != null) {
            info.setCredentialsSalt(ByteSource.Util.bytes(salt));
        }

        return info;
    }

    private String[] getPasswordForUser(String username) {
    	String[] passwordAndSalt = new String[2];
    	
    	User user = userService.find(username);
    	if (user != null) {
    		passwordAndSalt[0] = user.getPassword();
    		passwordAndSalt[1] = user.getPasswordSalt();
    	} 
    	return passwordAndSalt;
    }

    /**
     * This implementation of the interface expects the principals collection to return a String username keyed off of
     * this realm's {@link #getName() name}
     *
     * @see #getAuthorizationInfo(org.apache.shiro.subject.PrincipalCollection)
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        if (principals == null) {
            throw new AuthorizationException("PrincipalCollection method argument cannot be null.");
        }

        String username = (String) getAvailablePrincipal(principals);

        Set<String> roleNames = null;
        Set<String> permissions = null;

        roleNames = getRoleNamesForUser(username);
        permissions = getPermissions(username, roleNames);


        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roleNames);
        info.setStringPermissions(permissions);
        return info;

    }

    protected Set<String> getRoleNamesForUser(String username) {
        return userService.getRoleNames(username);
    }

    protected Set<String> getPermissions(String username, Collection<String> roleNames) {
    	
    	return roleService.getPermissions(roleNames.toArray(new String[]{}));
    }

}
