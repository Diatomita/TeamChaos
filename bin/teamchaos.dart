import 'dart:io';
import 'package:nyxx/nyxx.dart';
import 'champions.dart';

// Parametros de configuracao
final apiURL = 'https://static.bigbrain.gg/assets/lol/riot_patch_update/prod/champion-nicknames.json';
final apiHeaders = {'Host': 'static.bigbrain.gg',};
final pathArquivoChamps = 'champions.txt';
final tokenPath = '<YOUR_TOKEN_PATH_HERE>'

// Auxilia nas mensagens de log
void logTool(String message) {
  DateTime now = DateTime.now();
  print('[$now] [INFO] [$message]');
}

void main() async {
  // leitura do token
  final token = File(tokenPath).readAsStringSync();

  // criação do client
  final client = await Nyxx.connectGateway(token,
    GatewayIntents.allUnprivileged,
    options: GatewayClientOptions(plugins: [logging, cliIntegration]),
  );

  final botUser = await client.users.fetchCurrentUser();

  // loop do handle de eventos
  client.onMessageCreate.listen((event) async {
    commandInterpreter(event, botUser, 'update', () => botUpdate());
    commandInterpreter(event, botUser, 'roleta', () => botRoleta());
    commandInterpreter(event, botUser, 'barata', () => botBarata());
    commandInterpreter(event, botUser, 'hello', () => botPoples());
  });
}
