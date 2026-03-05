-- OAuth 2.0 / OIDC IdP 用テーブル
-- Kirihara Academy に追加するマイグレーション

-- クライアント登録
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `client_id` varchar(64) NOT NULL,
  `client_secret` varchar(128) NOT NULL,
  `redirect_uris` text NOT NULL COMMENT '改行区切りで複数登録可',
  `client_name` varchar(100) DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 認可コード（一時保存、10分で失効）
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `code` varchar(64) NOT NULL,
  `client_id` varchar(64) NOT NULL,
  `redirect_uri` varchar(512) NOT NULL,
  `member_id` bigint(20) unsigned NOT NULL,
  `scope` varchar(255) NOT NULL DEFAULT 'openid email profile',
  `code_challenge` varchar(128) DEFAULT NULL,
  `code_challenge_method` varchar(10) DEFAULT NULL,
  `expires_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`code`),
  KEY `oauth_auth_codes_expires_at_idx` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- eiken-app 用クライアント（初期データ）
-- client_secret は本番環境で変更すること
INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uris`, `client_name`, `created_at`)
VALUES (
  'eiken-app',
  'eiken-app-secret-change-me',
  'http://localhost:3000/auth/callback/kirihara\nhttps://eiken-app.example.com/auth/callback/kirihara',
  'eiken-app',
  UNIX_TIMESTAMP()
) ON DUPLICATE KEY UPDATE `client_id` = `client_id`;
