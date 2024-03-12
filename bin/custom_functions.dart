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

// Auxilia nas mensagens de log
void logTool(String message) {
  DateTime now = DateTime.now();
  print('[$now] [INFO] [$message]');
}

// Interpreta os comandos
void commandInterpreter(event, botUser, String command, Future<String> Function() func) async {
  if (event.mentions.contains(botUser) && event.message.content.toLowerCase().contains(command)) {
    await event.message.channel.sendMessage(MessageBuilder(
        content: await func(),
        replyId: event.message.id,
    ));
  }
}