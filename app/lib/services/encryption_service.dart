import 'dart:convert';
import 'dart:math';
import 'package:cryptography/cryptography.dart';

class EncryptionService {
  final _key = SecretKey([/* derived from user pin */]);

  Future<List<int>> encrypt(String plaintext) async {
    final aes = AesCbc.withCmac();
    final secretBox = await aes.encrypt(
      utf8.encode(plaintext),
      secretKey: _key,
    );
    return secretBox.cipherText;
  }

  Future<String> decrypt(List<int> ciphertext, List<int> nonce) async {
    final aes = AesCbc.withCmac();
    final secretBox = SecretBox(
      cipherText: ciphertext,
      nonce: nonce,
      mac: Mac(List.filled(8, 0)),
    );
    final plaintext = await aes.decrypt(
      secretBox,
      secretKey: _key,
    );
    return utf8.decode(plaintext);
  }
}
