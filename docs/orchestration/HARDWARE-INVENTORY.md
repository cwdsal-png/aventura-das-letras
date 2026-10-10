# Inventário de hardware — Aventura das Letras

## Confirmado pelo operador
- Placa de bancada: ESP32 clássico com Micro-USB, identificado pelo sketch de diagnóstico como **ESP32-D0WD-V3**, CPU **240 MHz**, Flash **4 MB**, porta **COM3** (Windows 11).
- Placa futura: ESP32-C3 SuperMini (não presumir carregador de bateria embarcado).
- Também disponíveis: ESP8266 NodeMCU/LoLin, ESP-01, protoboard, jumpers e cabos.
- MPU-6500/GY-6500: em trânsito, não disponível para testes físicos no marco M1/M2.
- **Bancada USB Windows 11 — 2026-10-10:** driver Silicon Labs CP210x reconhecido na COM3; Arduino IDE 2.3.10 com core Espressif ESP32 2.0.17, alvo provisório `ESP32 Dev Module`; sketch de diagnóstico gravado (`Hash of data verified`, reset RTS); monitor serial em 115200 baud exibiu repetidamente `ESP32 ativo - USB funcionando`. Modelo exato do chip confirmado em imagem posterior: ESP32-D0WD-V3, 240 MHz, Flash 4 MB. **Firmware definitivo e barramento I²C ainda não testados.**
- Baterias, acessórios e demais componentes: informados como existentes, sem inventário quantitativo validado.

## Montagem prevista V1 (após chegada do sensor)
| ESP32 clássico | MPU-6500 breakout |
| --- | --- |
| GPIO21 | SDA |
| GPIO22 | SCL |
| GND | GND |
| 3V3 | alimentação somente após conferir breakout |

O firmware busca endereços I2C 0x68 e 0x69; WHO_AM_I aceito 0x70, 0x71, 0x73, 0x78. Não presumir que o sensor de anúncio tenha o mesmo chip.

## Segurança da V2
- Uma LiPo 1S tem tensão de 4,2 V carregada; **não ligar diretamente ao pino 3V3**.
- Verificar carregador com proteção, chave, regulador e capacidade de corrente.
- ESP32-C3 SuperMini genérico não deve ser tratado como XIAO ESP32-C3; carregamento integrado não é garantido.
- Validar polaridade dos JST, isolamento, autonomia e aquecimento antes do case corporal.
- Posicionar IMU rigidamente no case e antena longe da bateria/metal quando possível.
