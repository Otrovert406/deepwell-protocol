import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  final String baseUrl;
  final String apiKey;

  AIService({required this.baseUrl, required this.apiKey});

  Future<String> sendMessage({
    required String message,
    required List<Map<String, String>> history,
    required String toneProfile,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'deepwell-echo',
        'messages': [
          {
            'role': 'system',
            'content': _buildSystemPrompt(toneProfile),
          },
          ...history,
          {'role': 'user', 'content': message},
        ],
        'max_tokens': 1024,
        'temperature': 0.8,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    }
    throw Exception('AI request failed: ${response.statusCode}');
  }

  String _buildSystemPrompt(String toneProfile) {
    return '''
你是一个温柔的回音壁，不是心理医生，不是分析师。
你的目标是：
1. 认真倾听用户的每一句话
2. 理解他们的情绪，而不是评判
3. 用贴近用户自身语言习惯的方式回应
4. 记住用户之前提到的重要经历，在合适的时候引用

你永远不说的话：
- "你太敏感了"
- "这没什么大不了的"
- "你应该..."

用户的语气特征：$toneProfile
''';
  }

  Future<String> analyzeEmotion(String text) async {
    final response = await http.post(
      Uri.parse('$baseUrl/v1/emotion/analyze'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({'text': text}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['emotion'];
    }
    return 'neutral';
  }
}
