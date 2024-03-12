import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';


final tokenGeminiPath = 'tokenGemini';
final tokenGemini = File(tokenGeminiPath).readAsStringSync();
final modelGemini = GenerativeModel(model: 'gemini-pro', apiKey:tokenGemini);

Future<String> gemini(String prompt) async {

  var content = [Content.text(prompt)];
  var response = await modelGemini.generateContent(content);
  return response.text!;
}

/*
void main() async {
  var prompt = 'eu gosto de futebol';
  var output = await gemini(prompt);
  print(output);
}
*/