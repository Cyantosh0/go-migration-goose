-- +goose Up
CREATE TABLE IF NOT EXISTS `team_users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(28) NOT NULL,
  `team_id` BINARY(16) NOT NULL,
  `role`    VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id_team_id` (`user_id`,`team_id`),
  KEY `fk_team_users_user_id_users_id` (`user_id`),
  KEY `fk_team_users_team_id_teams_id` (`team_id`),
  CONSTRAINT `fk_team_users_team_id_teams_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_team_users_user_id_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- +goose Down
DROP TABLE `team_users`;
