class Message {
  final String id;
  final String conversationId;
  final String role;
  final String content;
  final DateTime timestamp;
  final Map<String, dynamic>? emotionData;

  Message({
    required this.id,
    required this.conversationId,
    required this.role,
    required this.content,
    required this.timestamp,
    this.emotionData,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'conversationId': conversationId,
        'role': role,
        'content': content,
        'timestamp': timestamp.toIso8601String(),
        'emotionData': emotionData,
      };

  factory Message.fromMap(Map<String, dynamic> map) => Message(
        id: map['id'],
        conversationId: map['conversationId'],
        role: map['role'],
        content: map['content'],
        timestamp: DateTime.parse(map['timestamp']),
        emotionData: map['emotionData'],
      );
}
