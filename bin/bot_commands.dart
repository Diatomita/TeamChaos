import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'teamchaos.dart';
import 'custom_functions.dart';

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


// Funcao da roleta
Future<String> botRoleta(event) async {
  // Config do comando
  dynamic modificadores = modInterpreter(event.message.content, modChar);
  List<int> indexList = modificadores[0];
  List<String> charList = modificadores[1];
  List<String> valueList = modificadores[2];
  String modQntChamp = 'c';
  String modQntTime = 't';
  String modRepeat = 'r';
  int qntChamps = 5;
  int qntTimes = 1;

  // Le o arquivo e adiciona cada linha em uma lista
  List<String> champList = [];
  File(pathArquivoChamps).readAsLinesSync().forEach((champ) {
    champList.add(champ);
  });

  // Aplica o modificador C
  if (charList.contains(modQntChamp)) {
    qntChamps = int.parse(valueList[charList.indexOf(modQntChamp)]);
    // Reconhece o 10 como valor de modificador e aplica
    if (int.parse(event.message.content[indexList[charList.indexOf(modQntChamp)]+3]) == 0) {
      qntChamps = 10;
    }
  }

  List<String> teamsList = [];
  for (int i = 0; i < qntTimes; i++) {
    // Aplica o modificador T
    if (charList.contains(modQntTime)) {
      qntTimes = int.parse(valueList[charList.indexOf(modQntTime)]);
      // Reconhece o 10 como valor de modificador e aplica
      if (int.parse(event.message.content[indexList[charList.indexOf(modQntTime)]+3]) == 0) {
        qntTimes = 10;
      }
    }

    // Seleciona os champs aleatórios
    List<String> champSelected = [];
    for (int i = 0; i < qntChamps; i++) {
      int champAleatorio = Random().nextInt(champList.length);
      while (champSelected.contains(champList[champAleatorio])) {
        champAleatorio = Random().nextInt(champList.length);
      }

      // Aplica o modidificador R
      if (!charList.contains(modRepeat)) {
        for (String teams in teamsList) {
          while (teams.contains(champList[champAleatorio])) {
            champAleatorio = Random().nextInt(champList.length);
          }
        }
      }
      champSelected.add(champList[champAleatorio]);
    }

    logTool(champSelected.join(', '));
    String time = '\nTime ${i+1} :\n\n${champSelected.join('\n')}';
    teamsList.add(time);
  }
  String resultado = teamsList.join('\n--------------------');
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
