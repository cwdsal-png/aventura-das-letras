# Plano e registro de validação

**Importante:** resultado padrão = **NÃO EXECUTADO**. Não confundir testes sintéticos com validação física.

| ID | Teste | Como executar | Critério de aceite | Estado |
| --- | --- | --- | --- | --- |
| T01 | Git/Python | `git --version`, `py -3 --version` | Comandos respondem | NÃO EXECUTADO |
| T02 | Godot | Abrir `game/project.godot` no Godot 4.7.2 e F5 | Menu e atividade carregam | NÃO EXECUTADO |
| T03 | Teclado | Andar com A/D e pular com Espaço | Controle funcional | NÃO EXECUTADO |
| T04 | Publicação | `py -3 tools/check_publication.py` | Código de saída zero | NÃO EXECUTADO |
| T05 | Automação | `py -3 tools/run_tests.py` após definir `GODOT_BIN` | Suíte completa passa | NÃO EXECUTADO |
| T06 | Salto simulado | Testes Godot `sensor_game_jump` etc. da suíte | Eventos geram salto | NÃO EXECUTADO |
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
