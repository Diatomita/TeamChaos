import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nyxx/nyxx.dart';
import 'dart:math';
import 'teamchaos.dart';

// Atualiza a lista de personagens
Future<String> botUpdate() async {
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

// Monta o time aleatório
Future<String> botRoleta() async {
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

// KHAZIX
Future<String> botBarata() async {
  String msg = 'KHAZIX :cockroach::cockroach::cockroach:';
  logTool(msg);
  return msg;
}

// POPLES
Future<String> botPoples() async {
    String msg = 'poples';
    logTool(msg);
    return msg;
}

void commandInterpreter(event, botUser, String command, Future<String> Function() func) async {
  if (event.mentions.contains(botUser) && event.message.content.toLowerCase().contains(command)) {
    await event.message.channel.sendMessage(MessageBuilder(
        content: await func(),
        replyId: event.message.id,
    ));
  }
}
