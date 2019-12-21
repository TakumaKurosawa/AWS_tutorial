package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	// connection testAPI
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "ping",
		})
	})

	// ポートを設定しています。
	r.Run(":8080")
}
