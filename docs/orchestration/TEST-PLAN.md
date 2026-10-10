# Plano e registro de validação

**Importante:** resultado padrão = **NÃO EXECUTADO**. Não confundir testes sintéticos com validação física.

| ID | Teste | Como executar | Critério de aceite | Estado |
| --- | --- | --- | --- | --- |
| T01 | Git/Python | `git --version`, `py -3 --version` | Comandos respondem | PASSOU — informado pelo operador (Git 2.54.0, Python 3.14.5) |
| T02 | Godot | Abrir `game/project.godot` no Godot 4.7.2 e F5 | Menu e atividade carregam | PASSOU — jogo aberto e jogável, informado pelo operador |
| T03 | Teclado | Andar com A/D e pular com Espaço | Controle funcional | A CONFIRMAR — operador conseguiu jogar, mas não detalhou cada tecla |
| T04 | Publicação | `py -3 tools/check_publication.py` | Código de saída zero | PASSOU — operador relatou 393 arquivos, 74,2 MiB, 0 achados (10/10/2026) |
| T05 | Automação | `py -3 tools/run_tests.py` após definir `GODOT_BIN` | Suíte completa passa | PASSOU — `All selected tests passed.` (operador, Windows 11, 2026-10-10) |
| T06 | Salto simulado | Testes Godot `sensor_game_jump` etc. da suíte | Eventos geram salto | PASSOU — `sensor_game_jump`, 8/8 saltos repetidos e timeout Wi-Fi, todos sintéticos (`physical_sensor:false`) |
| T07 | MPU físico (futuro) | Scanner I2C e registro WHO_AM_I | Chip reconhecido | BLOQUEADO: sensor |
| T08 | Wi-Fi/latência (futuro) | Medição no hardware | Limites ainda por definir | BLOQUEADO: sensor |

## Registro por sessão
- Data, branch e commit:
- Versões de Python, Git e Godot:
- ID do teste e resultado (PASSOU / FALHOU / NÃO EXECUTADO):
- Mensagem de erro (sem dados pessoais ou tokens):
- Evidência (print do jogo ou log higienizado):
- Ação corretiva, responsável e próximo passo:

**Riscos relevantes:** Windows `select.select(sys.stdin)` no simulador; incompatibilidade de chip vendido como MPU-6500; arquivo de pareamento privado; regressões do modo sem sensor; regulador inadequado para picos Wi-Fi.

## Sessão — 2026-10-10 — validação manual Windows 11
- Fonte: relato do operador no chat após captura do editor Godot 4.7.2.
- Confirmados: Git 2.54.0, Python 3.14.5, projeto importado, jogo iniciado com F5 e partida jogável.
- Ainda não confirmados: teste individual das teclas A/D/Espaço/Esc, branch local ativa no momento do jogo, suite automatizada e caminho do executável Godot.
- Próxima ação: configurar `GODOT_BIN` na sessão PowerShell e executar `check_publication.py` e `run_tests.py`; registrar saídas antes de mudar estado de T04–T06.

## Sessão — 2026-10-10 — atualização de verificação de publicação
- Branch local: `chore/orquestrador-windows11-v1`, com tracking de origin configurado.
- `git pull --ff-only`: concluído; documentação TEST-PLAN atualizada.
- `py -3 tools/check_publication.py`: `Publication check: 393 files, 74.2 MiB, 0 findings.`
- **Atenção:** após abrir o Godot, o Git relatou modificações locais em `game/project.godot` e vários `game/art/*.import` e `game/audio/*.import`. Origem exata a verificar por `git diff` antes de restaurar ou versionar. Não foi executada limpeza destrutiva.
- Próximo: identificar caminho do Godot, examinar diffs locais e rodar `py -3 tools/run_tests.py` com `GODOT_BIN` configurado. Não atribuir aprovação T05/T06 sem logs.

## Sessão — 2026-10-10 — suíte automatizada (Windows 11)
- Comando: `py -3 tools/run_tests.py` executado no diretório raiz do repositório com `GODOT_BIN` apontando para Godot 4.7.2 (`4.7.2.stable.official.ed1daf0bf`). Python: 3.14.5.
- Resultado final informado pelo operador: `All selected tests passed.`
- Testes Python: 3 de `test_sensor_bridge` e 22 de `test_esp32_receiver`; ambos encerraram `OK`.
- Godot: curriculum (397/397), speedrun (38/38), gentle_flow (26/26), powers_continuity (43/43), adventure_terrain (84/84), lava_jump (51/51), respawn_collectibles (155/155), answer_feedback (37/37), acceptance (101/101) e demais cenários JSON `passed:true`.
- Simulação do sensor: `sensor_game_jump` aprovou aplicação da física e travessia de letra/lava/abismo; `sensor_repeat_jumps` registrou 8/8 saltos, sessão renovada; `sensor_wifi_timeout` registrou perda longa/retenção de prontidão em lacuna curta. **Todos sem sensor físico** (`physical_sensor:false`).
- **Pendência técnica:** algumas execuções Godot emitiram `ObjectDB instances were leaked at exit` e `resources still in use at exit` apesar de terminarem como aprovadas. Investigar cleanup e vazamento no encerramento antes de considerar qualidade de recursos concluída.
- **Pendência de Git local:** `game/project.godot` teve chave `window/size/mode=2` reordenada e `window/stretch/mode="disabled"` removida na execução do editor, junto de mudanças nos `.import`. Não versionar/restaurar sem decisão específica.
- Ainda aguardando: confirmação manual das teclas individuais T03; sensor MPU real e avaliação Wi-Fi física T07/T08.
