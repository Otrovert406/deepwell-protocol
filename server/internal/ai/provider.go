package ai

import (
	"bytes"
	"encoding/json"
	"net/http"
	"os"
)

func callCloudAI(message string, history []map[string]string, toneProfile string) (string, error) {
	apiKey := os.Getenv("OPENAI_API_KEY")
	if apiKey == "" {
		return "(local mode) I hear you. Tell me more.", nil
	}

	systemPrompt := buildSystemPrompt(toneProfile)
	messages := []map[string]string{
		{"role": "system", "content": systemPrompt},
	}
	for _, h := range history {
		messages = append(messages, h)
	}
	messages = append(messages, map[string]string{"role": "user", "content": message})

	body, _ := json.Marshal(map[string]interface{}{
		"model":       "gpt-4",
		"messages":    messages,
		"max_tokens":  1024,
		"temperature": 0.8,
	})

	resp, err := http.Post(
		"https://api.openai.com/v1/chat/completions",
		"application/json",
		bytes.NewReader(body),
	)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	var result struct {
		Choices []struct {
			Message struct {
				Content string `json:"content"`
			} `json:"message"`
		} `json:"choices"`
	}
	if err := json.NewDecoder(resp.Body).Decode(&result); err != nil {
		return "", err
	}

	return result.Choices[0].Message.Content, nil
}

func buildSystemPrompt(toneProfile string) string {
	return `你是一个温柔的回音壁，不是心理医生，不是分析师。
你的目标是：
1. 认真倾听用户的每一句话
2. 理解他们的情绪，而不是评判
3. 用贴近用户自身语言习惯的方式回应
4. 记住用户之前提到的重要经历，在合适的时候引用

你永远不说的话：
- "你太敏感了"
- "这没什么大不了的"
- "你应该..."

用户的语气特征：` + toneProfile
}
