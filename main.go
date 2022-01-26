package main

import (
	"embed"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
	"github.com/joho/godotenv"

	"github.com/Cyantosh0/goose-migration/config"
	"github.com/pressly/goose/v3"
)

//go:embed migrations/*.sql
var embedMigrations embed.FS

func main() {
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatalf("Error loading .env file")
	}

	config.DB = config.SetupDatabase()
	fmt.Println("DB Connection: Success")

	goose.SetBaseFS(embedMigrations)
	if err := goose.Up(config.DB.DB(), "migrations", goose.WithAllowMissing()); err != nil {
		fmt.Println("Error occurred in migration:", err)
	}
}
