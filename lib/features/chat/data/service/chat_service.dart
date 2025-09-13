import 'package:dio/dio.dart';

class DeepSeekCloudService {
  static String baseUrl = "https://openrouter.ai/api/v1";
  static String model = "deepseek/deepseek-chat-v3.1:free";
  static String key = "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";


  Future<String> sendMessage(String content) async {
    final Dio dio = Dio();
    try{
      final response = await dio.post(baseUrl,options: Options(
        headers:  {
        "Authorization": "Bearer $key",
        "Content-Type": "application/json",
        },
      ),
        data: {
          "model": model,
          "messages": [
            {
              "role": "system",
              "content":"You are helpful financial assistant."
            },
            {
              "role": "user","content": content
            },

          ],
        }
      );

      return response.data["choices"][0]["message"]["content"];

    }catch (e) {
      return "⚠ Ошибка: $e";
    }
  }
}