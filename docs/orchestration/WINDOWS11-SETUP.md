# Guia de implantacao — Windows 11 (sem MPU-6500)

> Executar no **PowerShell**, nao no terminal Python. O operador deve realizar estas etapas no seu PC; elas **nao** foram executadas remotamente.

## 1. Instalar e conferir ferramentas
- Instalar **Git for Windows**: https://git-scm.com/download/win
- Instalar **Python 3.10+**; recomendado 3.11 para consistencia: https://www.python.org/downloads/windows/
- Baixar **Godot 4.7.2 Standard** para Windows (nao .NET): https://godotengine.org/download/archive/4.7.2-stable/
- Arduino IDE sera necessario somente no marco M3; nao gravar ESP32 agora.

Abra um **novo** PowerShell depois da instalacao:
```powershell
git --version
py -3.11 --version
```
Se Python 3.11 nao estiver instalado, confirme sua versao com `py -3 --version` (deve ser >= 3.10) e substitua `py -3.11` nos comandos seguintes por `py -3`.

## 2. Clonar seu fork e cadastrar o original
```powershell
New-Item -ItemType Directory -Path "$HOME\Projetos" -Force | Out-Null
Set-Location "$HOME\Projetos"
git clone https://github.com/cwdsal-png/aventura-das-letras.git
Set-Location .\aventura-das-letras
git remote add upstream https://github.com/samarameneses/aventura-das-letras.git
git remote -v
git status
```
Se ja houver clone local, **nao** executar `git clone` de novo; abrir sua pasta existente. Se o remote `upstream` ja existir, **nao** repetir `git remote add upstream`.

## 3. Executar manualmente o jogo, sem ESP32
1. Descompactar o executavel do Godot 4.7.2 em uma pasta de sua preferencia.
2. Abrir o Godot e escolher **Importar**.
3. Selecionar `game/project.godot` dentro do clone.
4. Esperar a importacao de recursos terminar e pressionar **F5**.
5. Testar as setas ou A/D para andar, **Espaco** para saltar, **Esc** para pausar.
6. Registrar se menu, personagem e uma atividade educativa funcionam.

A primeira validacao nao exige `config.h`, placa ESP32, IMU ou conexao Wi-Fi.

## 4. Executar verificacoes automatizadas
No PowerShell, estando na raiz do clone, apontar a variavel `GODOT_BIN` ao executavel real do Godot no seu Windows (ajuste o caminho):
```powershell
$env:GODOT_BIN = "C:\Ferramentas\Godot\Godot_v4.7.2-stable_win64.exe"
Test-Path $env:GODOT_BIN
& $env:GODOT_BIN --version
py -3.11 tools/check_publication.py
py -3.11 tools/run_tests.py
```
**O primeiro teste `Test-Path` deve retornar `True`**. O nome do executavel pode variar; indique o arquivo `.exe` efetivo.

`run_tests.py` executa testes Python e testes Godot, incluindo eventos simulados de salto. Logs sao gerados em `evidence/`, ignorada pelo Git. Anote o resultado e erros relevantes em [TEST-PLAN.md](TEST-PLAN.md).

## 5. Simulacao interativa (verificacao pendente)
Existe `tools/sensor_bridge.py --simulate`, mas seu loop usa `select.select` sobre `sys.stdin`. No Windows, `select` da biblioteca padrao aceita sockets, nao stdin de console. **Portanto o modo interativo nao deve ser considerado funcional no Windows sem correcao e teste**.

O marco M2 pode ser validado pelos testes automatizados `sensor_game_jump`, `sensor_repeat_jumps` e outros ja incluidos em `run_tests.py`. Registrar uma Issue separada para adaptar o simulador interativo de forma portavel.

## 6. Como informar o resultado da sessao
- Versao de Git, Python e Godot.
- Tela inicial e gameplay abriram? [sim/nao]
- Movimento e salto pelo teclado funcionaram? [sim/nao]
- `check_publication.py`: [passou/falhou], mensagem se falhou.
- `run_tests.py`: [passou/falhou], teste que falhou se houver.
- Captura de tela apenas do jogo, sem dados pessoais.

## 7. Proxima etapa
Somente apos a linha de base passar, gerar `firmware/aventura_esp32/config.h` pela ferramenta oficial e ligar o MPU-6500 quando chegar. Nao gravar a placa antes de identificar o modelo e conferir o circuito.
