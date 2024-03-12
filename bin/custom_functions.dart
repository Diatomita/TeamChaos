import 'package:nyxx/nyxx.dart';

// Interpreta os modificadores dos comandos
dynamic modInterpreter(message, String modChar) {
  List<int> indexList = [];
  for (int i = 0; i < message.length; i++) {
    if (message[i] == modChar) {
      indexList.add(i);
    }
  }

  List<String> charList = [];
  for (int i = 0; i < indexList.length; i++) {
    charList.add(message[indexList[i]+1]);
  }

  List<String> valueList = [];
  for (int i = 0; i < indexList.length; i++) {
    try {
      valueList.add(message[indexList[i]+2]);
    } catch (e) {
      valueList.add('null');
    }
    
  }

  return [indexList, charList, valueList];
}

// Interpreta o valor 10 nos modificadores
int mod10Interpreter(event, String mod, int valueToChange, List<int> indexList, List<String> charList) {
  if (indexList[charList.indexOf(mod)]+3 < event.message.content.length) {
      if (int.parse(event.message.content[indexList[charList.indexOf(mod)]+3]) == 0) {
        valueToChange = 10;
      }
    }
    return valueToChange;
}

// Retorna toda a string que estiver após o comando de ativação
String commandSuppress(String input, String command) {
  var index = input.indexOf(command);
  return index != -1 ? input.substring(index + command.length) : '';
}

// Extrai os elementos com base no regex
List<String> extrairElementos(message) {
  final regexElementos = r"\[(.*?)\]";
  RegExp regex = RegExp(regexElementos);
  Match? match = regex.firstMatch(message);
  if (match != null) {
    String? elementosStr = match.group(1);
    if (elementosStr != null) {
      return elementosStr.split(',').map((e) => e.trim()).toList();
    }
  }
  return [];
}

// Auxilia nas mensagens de log
void logTool(String message) {
  DateTime now = DateTime.now();
  print('[$now] [INFO] [$message]');
}

// Interpreta os comandos
void commandInterpreter(event, botUser, String command, Future<String> Function() func) async {
  try {
    if (event.mentions.contains(botUser) && event.message.content.toLowerCase().contains(command)) {
    await event.message.channel.sendMessage(MessageBuilder(
        content: await func(),
        replyId: event.message.id,));
    }
  } catch (e) {
    logTool(e.toString());
    await event.message.channel.sendMessage(MessageBuilder(
        content: 'Erro ao executar o comando!',
        replyId: event.message.id,
    ));
  }
}