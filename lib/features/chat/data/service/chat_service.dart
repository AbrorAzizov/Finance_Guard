import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class DeepSeekCloudService {
  static String baseUrl = "https://openrouter.ai/api/v1/chat/completions";
  static String model = "deepseek/deepseek-chat-v3.1:free";
  static String key = "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"; // твой ключ

  Future<String> sendMessage(String content) async {
    final Dio dio = Dio();
    try {
      final response = await dio.post(
        baseUrl,
        options: Options(
          headers: {
            "Authorization": "Bearer $key",
            "Content-Type": "application/json",
          },
        ),
        data: {
          "model": model,
          "messages": [
            {"role": "system", "content": "You are a helpful financial assistant."},
            {"role": "user", "content": content},
          ],
        },
      );


      final data = response.data;
      debugPrint("DEBUG RESPONSE: $data");

      if (data is Map && data["choices"] is List && data["choices"].isNotEmpty) {
        return data["choices"][0]["message"]["content"];
      } else {
        return "⚠ Неверный формат ответа: $data";
      }
    } catch (e) {
      return "⚠ Ошибка: $e";
    }
  }
}
