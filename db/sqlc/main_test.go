package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)
const (
	dbDriver = "postgres"
	dbSource = "postgresql://root:secret@localhost:5432/my_bank?sslmode=disable"
)
var tesQueries *Queries

func TestMain(m *testing.M) {
	conn, err := sql.Open(driverName, dataSourceName)
	if err != nil{
		log.Fatal("cannot connect to database", err)
	}
	tesQueries = New(conn)
	os.Exit(m.Run())
}