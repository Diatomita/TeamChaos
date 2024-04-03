<!-- Nome -->
<h1 align="center">TeamChaos</h1>

<!-- Descrição -->
<p>TeamChaos é um bot do Discord desenvolvido em Dart, projetado para destruir (ou não) suas partidas de League of Legends com composições de equipe caóticas, garantindo que você e seus amigos se divirtam, mesmo que isso signifique perder alguns PDLs ao longo do caminho!</p>

<h2 align="center">Uso</h2>

<p>TeamChaos responde a comandos com base na presença de palavras-chave específicas em suas mensagens, e não é sensível a maiúsculas e minúsculas.</p>

<p><strong>Nota: Alguns comandos e recursos podem ser temporários e estão sujeitos a alterações significativas!</strong></p>

<h3 align="center">Roleta</h3>
<p>Gera composições de equipe com valores padrão (1 composição com 5 campeões).</p>
<p>Exemplo: <code>@TeamChaos roleta</code></p>

#### Modificadores
Os modificadores podem ser combinados para ajustar o resultado esperado na roleta.
#### +c
Um modificador para especificar a quantidade de campeões na composição.
- Exemplo: `@TeamChaos roleta +c3` - Gera uma composição com 3 campeões.
#### +t
Um modificador para especificar a quantidade de composições a serem geradas.
- Exemplo: `@TeamChaos roleta +t5` - Gera 5 composições.
#### +r
Esse modificador permite que campeões possam aparecer em mais de uma composição.
- Exemplo: `@TeamChaos roleta +t5 +r`
#### +o
Esse modificador serve para roletar uma lista de coisas contidas em chaves e separadas por vírgulas.
- Exemplo: `@TeamChaos roleta +o [joao, maria, pedro]`

<h3 align="center">Update</h3>
<p>Consulta uma API para atualizar a lista de campeões que é armazenada localmente.</p>
<p>Exemplo: <code>@TeamChaos update</code></p>

<h3 align="center">Barata</h3>
<p>Um comando bastante inútil, simplesmente responde com <strong>KHAZIX :cockroach: :cockroach: :cockroach:</strong></p>
<p>Exemplo: <code>@TeamChaos qual q é o nome daquele campeao q parece uma barata</code></p>

<h3 align="center">Hello</h3>
<p>Outro comando quase inútil, responde <strong>poples!</strong>, bom para ser usado para testar se o bot está funcionando.</p>
<p>Exemplo: <code>@TeamChaos hello</code></p>

<h3 align="center">Gemini</h3>
<p>Talvez o único comando realmente útil, serve para passar perguntas para a IA Gemini.</p>
<p>Exemplo: <code>@TeamChaos gemini qual suporte possui sinergia com caitlyn em uma matchup contra lucian e nautilus?</code></p>

<p><strong>Nota: O tamanho da resposta da IA está limitado a 2000 caracteres</strong></p>
