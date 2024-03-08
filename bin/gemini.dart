import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';


final tokenGeminiPath = 'tokenGemini';
final tokenGemini = File(tokenGeminiPath).readAsStringSync();
final modelGemini = GenerativeModel(model: 'gemini-pro', apiKey:tokenGemini);
void main() async {
  while (true) {
    stdout.write('Prompt: ');
    String prompt = stdin.readLineSync()!;

    var content = [Content.text(prompt)];
    var response = await modelGemini.generateContent(content);
    print('Output: ${response.text}');
  }
}