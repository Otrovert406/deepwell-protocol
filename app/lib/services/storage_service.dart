import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class StorageService {
  Database? _db;

  Future<void> initialize() async {
    final dbPath = await getDatabasesPath();
    _db = await openDatabase(
      p.join(dbPath, 'deepwell.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id TEXT PRIMARY KEY,
            displayName TEXT NOT NULL,
            createdAt TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE conversations (
            id TEXT PRIMARY KEY,
            userId TEXT NOT NULL,
            createdAt TEXT NOT NULL,
            updatedAt TEXT NOT NULL,
            FOREIGN KEY (userId) REFERENCES users(id)
          )
        ''');
        await db.execute('''
          CREATE TABLE messages (
            id TEXT PRIMARY KEY,
            conversationId TEXT NOT NULL,
            role TEXT NOT NULL,
            content TEXT NOT NULL,
            timestamp TEXT NOT NULL,
            emotionData TEXT,
            FOREIGN KEY (conversationId) REFERENCES conversations(id)
          )
        ''');
      },
    );
  }

  Database get db {
    if (_db == null) throw Exception('Database not initialized');
    return _db!;
  }
}
