
-- 初始化管理员
INSERT INTO `users`(username, password, password_salt) VALUES ('admin', 'f6fdffe48c908deb0f4c3bd36c032e72', 'admin');

-- 初始化管理员角色
INSERT INTO `role`(name) VALUES ('admin');

-- 给管理员赋予管理员角色
INSERT INTO `user_roles`(username, role_name) VALUES ('admin', 'admin');

-- 添加默认支持的语言
INSERT INTO `lang`(id, name) VALUES ('en', '英文');
INSERT INTO `lang`(id, name) VALUES ('zh', '中文');