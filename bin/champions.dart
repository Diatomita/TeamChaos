import 'dart:io';
import 'dart:math';

String pathArquivoChamps = 'champions.txt';

void main() {
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

  print('Nomes selecionados:\n${champSelected.join('\n')}');
}
