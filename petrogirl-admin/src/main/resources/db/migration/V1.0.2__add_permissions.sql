
-- 添加 "添加新闻" 的权限
INSERT INTO `permission`(name) VALUES ('news:add');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'news:add');

-- 添加 "删除新闻" 的权限
INSERT INTO `permission`(name) VALUES ('news:del');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'news:del');

-- 添加 "显示新闻列表" 的权限
INSERT INTO `permission`(name) VALUES ('news:list');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'news:list');

-- 添加 "添加新闻类别" 的权限
INSERT INTO `permission`(name) VALUES ('news:category:add');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'news:category:add');
-- 添加 "删除新闻类别" 的权限
INSERT INTO `permission`(name) VALUES ('news:category:del');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'news:category:del');
-- 添加 "显示新闻类别列表" 的权限
INSERT INTO `permission`(name) VALUES ('news:category:list');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'news:category:list');



-- 添加 "添加产品" 的权限
INSERT INTO `permission`(name) VALUES ('product:add');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'product:add');
-- 添加 "删除产品" 的权限
INSERT INTO `permission`(name) VALUES ('product:del');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'product:del');
-- 添加 "显示产品列表" 的权限
INSERT INTO `permission`(name) VALUES ('product:list');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'product:list');




-- 添加 "添加产品类别" 的权限
INSERT INTO `permission`(name) VALUES ('product:category:add');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'product:category:add');
-- 添加 "删除产品类别" 的权限
INSERT INTO `permission`(name) VALUES ('product:category:del');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'product:category:del');
-- 添加 "显示产品类别列表" 的权限
INSERT INTO `permission`(name) VALUES ('product:category:list');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'product:category:list');




-- 添加 "显示语言" 的权限
INSERT INTO `permission`(name) VALUES ('lang:list');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'lang:list');
-- 添加 "添加语言" 的权限
INSERT INTO `permission`(name) VALUES ('lang:add');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'lang:add');


-- 添加 "添加部门" 的权限
INSERT INTO `permission`(name) VALUES ('depart:add');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'depart:add');
-- 添加 "部门列表" 的权限
INSERT INTO `permission`(name) VALUES ('depart:list');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'depart:list');


-- 添加 "添加员工" 的权限
INSERT INTO `permission`(name) VALUES ('user:add');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'user:add');
-- 添加 "员工列表" 的权限
INSERT INTO `permission`(name) VALUES ('user:list');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'user:list');


-- 添加 "添加角色" 的权限
INSERT INTO `permission`(name) VALUES ('role:add');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'role:add');
-- 添加 "角色列表" 的权限
INSERT INTO `permission`(name) VALUES ('role:list');
-- 将权限赋予管理员角色
INSERT INTO `role_permissions`(role_name, permission) VALUES ('admin', 'role:list');






