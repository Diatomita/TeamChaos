import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nyxx/nyxx.dart';
import 'dart:math';

// Parametros de configuracao
final apiURL = 'https://static.bigbrain.gg/assets/lol/riot_patch_update/prod/champion-nicknames.json';
final apiHeaders = {
  'Host': 'static.bigbrain.gg',
};
final pathArquivoChamps = 'champions.txt';

// Auxilia nas mensagens de log
void logTool(String message) {
  DateTime now = DateTime.now();
  print('[$now] [INFO] [$message]');
}

// Pong
void botPing(event, botUser, String command) async {
  Future<String> function() async{
    String msg = 'Pong!';
    logTool(msg);
    return msg;
  }

  if (event.mentions.contains(botUser) && event.message.content.toLowerCase().contains(command)) {
    await event.message.channel.sendMessage(MessageBuilder(
        content: await function(),
        replyId: event.message.id,
    ));
  }

}

// Atualiza a lista de personagens
void botUpdate(event, botUser, String command) async {
  Future<String> function() async {
    // Consulta a API e retorna o JSON com os bonecos
    logTool('Buscando os dados...');
    var url = Uri.parse(apiURL);

    var response = await http.get(url, headers: apiHeaders);
    logTool('Dados encontrados.');

    if (response.statusCode == 200) {
      // Decodifica o JSON pra um mapa
      Map<String, dynamic> championsMap = json.decode(response.body);

      // Extrai os nomes dos bonecos
      List<String> champions = championsMap.keys.toList();

      // Grava os nomes em champions.txt
      File championsFile = File('champions.txt');
      championsFile.writeAsStringSync(champions.join('\n'));
      
      String successMsg = 'Os dados foram atualizados com sucesso!';
      logTool(successMsg);
      return successMsg;
    } else {
      String errorMsg = 'Erro ao atualizar os dados!';
      logTool(errorMsg);
      return errorMsg;
    }
  }
  
  if (event.mentions.contains(botUser) && event.message.content.toLowerCase().contains(command)) {
    await event.message.channel.sendMessage(MessageBuilder(
        content: await function(),
        replyId: event.message.id,
    ));
  }
}

// Monta o time aleatório
void botRoleta(event, botUser, String command) async {
    Future<String> function() async {
      // Le o arquivo e adiciona cada linha em uma lista
      List<String> champList = [];
      File(pathArquivoChamps).readAsLinesSync().forEach((champ) {
        champList.add(champ);
      });

      // Seleciona 5 champs aleatórios
      int quantidade = 5;
      List<String> champSelected = [];

      for (int i = 0; i < quantidade; i++) {
        int champAleatorio = Random().nextInt(champList.length);
        champSelected.add(champList[champAleatorio]);
      }

      logTool(champSelected.join('-'));
      String resultado = 'Time formado:\n\n${champSelected.join('\n')}';
      return resultado;
    }
  
  if (event.mentions.contains(botUser) && event.message.content.toLowerCase().contains(command)) {
    await event.message.channel.sendMessage(MessageBuilder(
        content: await function(),
        replyId: event.message.id,
    ));
  }
}

// KHAZIX
void botBarata(event, botUser, String command) async {
  Future<String> function() async {
    String msg = 'KHAZIX :cockroach::cockroach::cockroach:';
    logTool(msg);
    return msg;
  }
  
  if (event.mentions.contains(botUser) && event.message.content.toLowerCase().contains(command)) {
    await event.message.channel.sendMessage(MessageBuilder(
        content: await function(),
        replyId: event.message.id,
    ));
  }
}

// POPLES
void botPoples(event, botUser, String command) async {
  Future<String> function() async {
    String msg = 'poples';
    logTool(msg);
    return msg;
  }
  
  if (event.mentions.contains(botUser) && event.message.content.toLowerCase().contains(command)) {
    await event.message.channel.sendMessage(MessageBuilder(
        content: await function(),
        replyId: event.message.id,
    ));
  }
}
void main() async {
  // leitura do token
  final token = File('token').readAsStringSync();

  // criação do client
  final client = await Nyxx.connectGateway(token,
    GatewayIntents.allUnprivileged,
    options: GatewayClientOptions(plugins: [logging, cliIntegration]),
  );

  final botUser = await client.users.fetchCurrentUser();

  client.onMessageCreate.listen((event) async {
    botPing(event, botUser, 'ping');
    botUpdate(event, botUser, 'update');
    botRoleta(event, botUser, 'roleta');
    botBarata(event, botUser, 'barata');
    botPoples(event, botUser, 'hello');
  });
}