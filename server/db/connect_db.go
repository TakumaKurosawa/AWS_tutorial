package db

import (
	"./model"
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

func GormCreate() *gorm.DB {
	ip := "hoge-db.cwdbebkweoyi.us-east-1.rds.amazonaws.com"

	DBMS := "mysql"
	USER := "root"
	PASS := "hoge9630"
	PROTOCOL := "tcp(" + ip + ":3306)"
	DBNAME := "orenotorero"
	CONNECT := USER + ":" + PASS + "@" + PROTOCOL + "/" + DBNAME

	db, err := gorm.Open(DBMS, CONNECT)
	if err != nil {
		panic(err.Error())
	}

	db = migration(db)

	fmt.Printf("db connected: %+v\n", db)
	return db
}

func migration(db *gorm.DB) *gorm.DB {
	db.Set("gorm:table_options", "ENGINE=InnoDB")

	db.SingularTable(true)
	db.AutoMigrate(
		&model.User{},
	)

	return db
}
