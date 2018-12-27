package main

import (
	"html/template"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type IndexPage struct {
}

func main() {
	log.Print("Started!")
	router := mux.NewRouter()
	router.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		log.Print("Request received!")
		tmpl := template.Must(template.ParseFiles("static/index.html"))
		data := IndexPage{}
		tmpl.Execute(w, data)
	}).Methods("GET")
	log.Fatal(http.ListenAndServe("0.0.0.0:5678", router))
}
