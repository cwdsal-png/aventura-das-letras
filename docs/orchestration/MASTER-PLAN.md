# Plano mestre — Aventura das Letras (fork)

## Objetivo da V1
Reproduzir o jogo original em Windows 11, demonstrar que o modo sem sensor permanece operacional e validar a integracao de eventos de salto **simulados**, antes de conectar a IMU real.

## Objetivo da V2
Montar modulo corporal compacto com ESP32-C3 SuperMini, bateria LiPo 1S, carregador e regulador **adequados a placa efetivamente usada**, medindo autonomia e seguranca eletrica.

| Marco | Entrega | Dependencias | Criterio de aceite | Estado inicial |
| --- | --- | --- | --- | --- |
| M0 — GitHub | Fork e fluxo de trabalho | Conta conectada | Fork editavel e PR de governanca criado | Fork confirmado; PR pendente |
| M1 — Windows | Instalacao e teste manual | Git, Python >=3.10, Godot 4.7.2 Standard | Jogo abre, personagem movimenta e salta com teclado | Nao testado |
| M2 — Sem MPU | Testes automatizados e simulacao de evento | M1 | `check_publication.py`, `run_tests.py` executados e resultados anotados | Nao testado |
| M3 — ESP32 USB | Firmware e sensor real | Chegada do MPU-6500, M2 | I2C reconhece chip; 100 Hz aproximados; receptor recebe pacotes | Aguardando hardware |
| M4 — Wi-Fi | Transporte e detector fisico | M3 | Saltos reais reconhecidos, reconexao avaliada, falsos positivos registrados | Nao iniciado |
| M5 — Portatil | ESP32-C3, LiPo e case 3D | M4, esquematico validado | Alimentacao segura, autonomia medida, ergonomia testada | Nao iniciado |
| M6 — Produto | Conteudo/UX proprios | M1 e escopo aprovado | Alteracoes versionadas, jogo e testes preservados | Escopo aberto |

## Gates de qualidade
- **G1:** modo sem sensor nao pode regredir.
- **G2:** nao registrar sucesso de simulacao como teste de hardware.
- **G3:** toda alteracao do protocolo deve manter testes Python e Godot.
- **G4:** energia 1S LiPo apenas apos verificar placa, corrente, protecao e polaridade.
- **G5:** sem tokens de pareamento, Wi-Fi, fotos pessoais ou dumps em commits/logs.

## Prioridade imediata
1. Executar [WINDOWS11-SETUP.md](WINDOWS11-SETUP.md).
2. Registrar resultados no modelo [TEST-PLAN.md](TEST-PLAN.md).
3. Abrir o projeto no editor e fazer teste manual de teclado.
4. Verificar a compatibilidade do simulador interativo com Windows antes de utiliza-lo.
5. Criar backlog de personalizacao **depois** de confirmar a linha de base.

## Escopo ainda a aprovar
- Novo nome e identidade visual da versao.
- Faixa etaria e objetivos pedagogicos.
- Movimentos novos alem de salto.
- Plataforma de distribuicao (Windows primeiro; outras depois).
- Requisitos de case (local de fixacao no corpo, dimensoes da bateria, autonomia alvo).
