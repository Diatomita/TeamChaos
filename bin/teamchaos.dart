import 'dart:io';
import 'package:nyxx/nyxx.dart';
import 'bot_commands.dart';
import 'custom_functions.dart';

// Parametros de configuracao
final apiURL = 'https://static.bigbrain.gg/assets/lol/riot_patch_update/prod/champion-nicknames.json';
final apiHeaders = {'Host': 'static.bigbrain.gg',};
final pathArquivoChamps = 'champions.txt';
final tokenDiscordPath = 'tokenDiscord';
final tokenGeminiPath = 'tokenGemini';
final modChar = '+';

void main() async {
  // Leitura do token
  final token = File(tokenDiscordPath).readAsStringSync();

  // Criação do client
  final client = await Nyxx.connectGateway(token,
    GatewayIntents.allUnprivileged,
    options: GatewayClientOptions(plugins: [logging, cliIntegration]),
  );

  final botUser = await client.users.fetchCurrentUser();

  // Loop do handle de eventos
  client.onMessageCreate.listen((event) async {
    commandInterpreter(event, botUser, 'update', () => botUpdate());
    commandInterpreter(event, botUser, 'roleta', () => botRoleta(event));
    commandInterpreter(event, botUser, 'barata', () => botBarata());
    commandInterpreter(event, botUser, 'hello', () => botPoples());
    commandInterpreter(event, botUser, 'gemini', () => botGemini(event, 'gemini'));
  });
}