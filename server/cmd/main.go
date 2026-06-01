package main

import (
	"log"
	"net/http"
	"os"

	"github.com/gorilla/mux"
	"github.com/joho/godotenv"
	"github.com/Otrovert406/deepwell-protocol/server/internal/ai"
	"github.com/Otrovert406/deepwell-protocol/server/internal/auth"
)

func main() {
	godotenv.Load()

	r := mux.NewRouter()

	r.HandleFunc("/api/health", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("{\"status\":\"ok\"}"))
	}).Methods("GET")

	r.HandleFunc("/api/chat", ai.HandleChat).Methods("POST")
	r.HandleFunc("/api/emotion/analyze", ai.HandleEmotionAnalysis).Methods("POST")
	r.HandleFunc("/api/auth/register", auth.HandleRegister).Methods("POST")

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("Deepwell server starting on :%s", port)
	log.Fatal(http.ListenAndServe(":"+port, r))
}
