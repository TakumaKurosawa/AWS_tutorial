package model

type User struct {
	Id       string `json:"id"       gorm:"type:varchar(255); PRIMARY_KEY;NOT NULL"`
	Name     string `json:"name"     gorm:"type:varchar(255); NOT NULL"`
	Email    string `json:"email"    gorm:"type:varchar(255); NOT NULL"`
}
