package ai

import (
	"encoding/json"
	"net/http"
)

type ChatRequest struct {
	Message    string              `json:"message"`
	History    []map[string]string `json:"history"`
	ToneProfile string             `json:"toneProfile"`
}

type ChatResponse struct {
	Reply   string `json:"reply"`
	Emotion string `json:"emotion"`
}

type EmotionRequest struct {
	Text string `json:"text"`
}

type EmotionResponse struct {
	Emotion string `json:"emotion"`
}

func HandleChat(w http.ResponseWriter, r *http.Request) {
	var req ChatRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// TODO: Route to cloud API or local model based on complexity
	reply, err := callCloudAI(req.Message, req.History, req.ToneProfile)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	resp := ChatResponse{Reply: reply, Emotion: "neutral"}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resp)
}

func HandleEmotionAnalysis(w http.ResponseWriter, r *http.Request) {
	var req EmotionRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	resp := EmotionResponse{Emotion: "neutral"}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resp)
}
