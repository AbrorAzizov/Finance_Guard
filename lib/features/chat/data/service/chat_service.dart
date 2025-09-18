import 'package:dio/dio.dart';

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
      print("DEBUG RESPONSE: $data");

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
