# Orquestrador — Aventura das Letras (fork)

> Plano de engenharia do fork `cwdsal-png/aventura-das-letras`. Esta documentacao nao substitui a documentacao original em `docs/`. Plataforma de trabalho: **Windows 11**.

## Missao
Criar e manter uma versao propria do jogo educativo, preservando o funcionamento **sem sensor** e evoluindo gradualmente a interface opcional de movimento, primeiro com ESP32 classico e depois com ESP32-C3 SuperMini.

## Estado inicial (2026-10-10)
- Fork identificado na conta GitHub `cwdsal-png`; branch de trabalho criada: `chore/orquestrador-windows11-v1`.
- Hardware de bancada escolhido: ESP32 classico das fotografias (pinagem final a confirmar na placa).
- Hardware V2: ESP32-C3 SuperMini, **sem carregador LiPo integrado presumido**.
- MPU-6500/GY-6500 em transito; nenhum teste fisico com esse modulo registrado.
- Ambiente local Windows 11 e execucao do jogo: **pendentes de validacao pelo operador**.
- Nenhum resultado de testes locais deve ser considerado aprovado antes de evidencia.

## Documentos de controle
- [MASTER-PLAN.md](MASTER-PLAN.md): marcos, escopo e dependencias.
- [WINDOWS11-SETUP.md](WINDOWS11-SETUP.md): instalacao, clonagem e testes sem MPU.
- [HARDWARE-INVENTORY.md](HARDWARE-INVENTORY.md): inventario, limites e mapa de conexoes.
- [TEST-PLAN.md](TEST-PLAN.md): criterios de aceite, registros e riscos.
- [DECISIONS.md](DECISIONS.md): decisoes arquiteturais e pontos em aberto.

## Operacao no GitHub
1. Abrir uma Issue por entrega reproduzivel, com objetivo, escopo, criterio de aceite e evidencia esperada.
2. Desenvolver uma mudanca por branch: `feat/*`, `fix/*`, `docs/*` ou `chore/*`.
3. Usar pull request para revisar, registrar riscos e executar a CI antes de integrar na `main`.
4. Nao modificar diretamente o repositório original (`samarameneses/aventura-das-letras`).
5. Conservar avisos de licenca MIT e autoria; nao publicar credenciais, tokens ou identificadores pessoais.

## Reuniao de acompanhamento (manual, ao fim de cada sessao)
- O que foi entregue, com link e evidencia?
- O que bloqueia o proximo marco?
- Que mudanca afetou hardware/firmware/Python/Godot?
- Quais testes passaram e quais nao foram executados?
- Qual e a proxima acao com responsavel e criterio de conclusao?

## Papéis
- Operador: instalacoes e testes fisicos no PC/ESP32, validacao de experiencia e aprovacoes.
- Assistente: apoiar codigo, revisao, documentacao, plano de testes e organizacao das Issues/PRs quando autorizado.

**Nota:** este orquestrador e um processo documentado com GitHub, nao um agente autonomo permanente.
