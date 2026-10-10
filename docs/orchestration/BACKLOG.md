# Backlog inicial do orquestrador

Status: PROPOSTO, aguardando ativação de Issues no repositório. Nenhuma tarefa abaixo foi executada fisicamente.

| ID | Entrega | Prioridade | Dependência | Aceite |
| --- | --- | --- | --- | --- |
| M1-01 | Instalar Git/Python/Godot no Windows 11 | Alta | Nenhuma | Versões verificadas |
| M1-02 | Clonar fork e executar Godot com F5 | Alta | M1-01 | Teclado e uma atividade testados |
| M2-01 | Rodar check_publication e run_tests | Alta | M1-02 | Relatório real registrado |
| M2-02 | Corrigir simulador interativo para console Windows | Alta | M1-02 | J+Enter gera salto após calibração |
| M3-01 | Identificar placa e testar MPU-6500 por I2C/USB | Alta | Chegada MPU, M2 | Chip identificado, amostras reais |
| M4-01 | Medir detector físico e Wi-Fi | Média | M3 | Evidências de falsos positivos, reconexão e latência |
| M5-01 | Migrar para ESP32-C3 SuperMini e preparar bateria/case | Média | M4 | Energia, autonomia e ergonomia validadas |
| M6-01 | Definir diferenciais educacionais e identidade do jogo | Alta | Jogo funcionando | Escopo V1 de personalização aprovado |

## Ativar Issues
No GitHub, abrir **Settings > General > Features > Issues** do fork `cwdsal-png/aventura-das-letras`, e marcar Issues. Não alterar outras permissões desnecessariamente. Depois cada linha da tabela pode ser criada como Issue com checklist, evidências e responsável.

## Política de execução
Não alterar firmware nem criar versão portátil antes da validação da linha de base e inspeção do hardware. Nenhum status de teste deve ser considerado PASSOU por simples presença de arquivos ou CI do repositório original.
