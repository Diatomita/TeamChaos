# TeamChaos

TeamChaos é um bot do Discord desenvolvido em Dart, projetado para animar (ou destruir) suas partidas de League of Legends com composições de equipe caóticas, garantindo que você e seus amigos se divirtam, mesmo que isso signifique perder alguns PDLs ao longo do caminho!

## Uso

TeamChaos responde a comandos com base na presença de palavras-chave específicas em suas mensagens, e não é sensível a maiúsculas e minúsculas.

**Nota: Alguns comandos e recursos podem ser temporários e estão sujeitos a alterações significativas!**

### Roleta
Gera composições de equipe com valores padrão (1 composição com 5 campeões).
- Exemplo: `@TeamChaos roleta`
#### Modificadores
Os modificadores podem ser combinados para ajustar o resultado esperado na roleta.
##### +c
Um modificador para especificar a quantidade de campeões na composição.
- Exemplo: `@TeamChaos roleta +c3` - Gera uma composição com 3 campeões.
##### +t
Um modificador para especificar a quantidade de composições a serem geradas.
- Exemplo: `@TeamChaos roleta +t5` - Gera 5 composições.
### Update
Consulta uma API para atualizar a lista de campeões que é armazenada localmente.
- Exemplo: `@TeamChaos update`
### Barata
Um comando bastante inútil, simplesmente responde com **KHAZIX :cockroach: :cockroach: :cockroach:**
- Exemplo: `@TeamChaos qual q é o nome daquele campeao q parece uma barata`
### Hello
Outro comando quase inútil, responde **poples!**, bom para ser usado para testar se o bot está funcionando.
- Exemplo: `@TeamChaos hello`
### Gemini
Talvez o único comando realmente útil, serve para passar perguntas para a IA Gemini.
- Exemplo: `@TeamChaos gemini qual suporte possui sinergia com caitlyn em uma matchup contra lucian e nautilus?`

**Nota: O tamanho da resposta da IA está limitado a 2000 caracteres**
