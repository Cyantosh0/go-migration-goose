-- +goose Up
CREATE TABLE IF NOT EXISTS `new` (
  `id` VARCHAR(28) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

-- +goose Down
DROP TABLE `new`;
