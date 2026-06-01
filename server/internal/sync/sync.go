package sync

type ShareRequest struct {
	Content string `json:"content"`
	Platform string `json:"platform"` // "moments", "xiaohongshu"
	Anonymous bool   `json:"anonymous"`
}

type ShareResponse struct {
	URL string `json:"url"`
}

// TODO: Implement WeChat Moments and Xiaohongshu sharing
