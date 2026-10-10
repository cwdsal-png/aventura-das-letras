# Registro de decisões e pendências

| ID | Decisão | Estado | Evidência / ressalva |
| --- | --- | --- | --- |
| ADR-001 | Windows 11 será a estação de desenvolvimento | Definida | Declarado pelo operador |
| ADR-002 | Usar o fork `cwdsal-png/aventura-das-letras` | Definida | Fork confirmado no GitHub |
| ADR-003 | ESP32 clássico para bancada V1 | Definida | Fotos; variante exata por confirmar |
| ADR-004 | ESP32-C3 SuperMini para V2 portátil | Diretriz | Exige teste firmware/energia |
| ADR-005 | Testar jogo e salto simulado antes da IMU | Definida | Testes do projeto já incluem simulações |
| ADR-006 | Manter modo sem sensor e licença MIT | Definida | Política do fork |

## Decisões abertas
- Modelo exato do ESP32 de bancada e driver USB-serial necessário.
- Sensor físico MPU-6500: part number, breakout e identificação I2C.
- Portabilidade do simulador de console para Windows 11.
- Nome, arte e escopo de personalização do jogo.
- Bateria/carga/regulação específicos da placa C3 e design do case.
- Metas quantitativas de latência, falsos positivos e autonomia.
