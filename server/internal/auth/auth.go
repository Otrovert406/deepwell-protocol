package auth

import (
	"encoding/json"
	"net/http"
)

type RegisterRequest struct {
	DeviceID string `json:"deviceId"`
}

type RegisterResponse struct {
	Token string `json:"token"`
}

func HandleRegister(w http.ResponseWriter, r *http.Request) {
	var req RegisterRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// TODO: Generate device-bound token, no email/password required
	resp := RegisterResponse{Token: "device-token-placeholder"}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resp)
}
