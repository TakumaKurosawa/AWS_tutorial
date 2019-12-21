package main

import (
	"awstutorial/db"
	"awstutorial/db/Model"
	"github.com/gin-gonic/gin"
)

func main() {
	dbInstance := db.GormCreate()
	defer dbInstance.Close()

	user := model.User{
		Id:    "user1",
		Name:  "sample",
		Email: "h1@h1.com",
	}
	dbInstance.Create(user)

	var getUser model.User
	dbInstance.Find(&getUser)

	r := gin.Default()

	// connection testAPI
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "ping",
		})
	})

	r.GET("/users", func(context *gin.Context) {
		context.JSON(200, gin.H{
			"users": getUser,
		})
	})

	// ポートを設定しています。
	r.Run(":8080")
}
