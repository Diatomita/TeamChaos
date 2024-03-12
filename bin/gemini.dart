import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';


final tokenGeminiPath = 'tokenGemini';
final tokenGemini = File(tokenGeminiPath).readAsStringSync();
final modelGemini = GenerativeModel(model: 'gemini-pro', apiKey:tokenGemini);

Future<String> gemini(String prompt) async {
  String input = prompt;
  var content = [Content.text(input)];
  var output = await modelGemini.generateContent(content);
  String response = output.text!;
  // Limita o tamanho do output até 2000 chars
  if (response.length > 2000) {
    response = response.substring(0, 2000);
  }
  return response;
}

/*
void main() async {
  var prompt = 'eu gosto de futebol';
  var output = await gemini(prompt);
  print(output);
}
*/