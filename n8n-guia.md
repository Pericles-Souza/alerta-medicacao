# Guia n8n — Alerta de Medicação

## Objetivo
Configurar um fluxo gratuito para ler os dados da planilha, identificar os horários de envio e disparar mensagens por WhatsApp, SMS e áudio.

## Etapas
1. **Criar conta gratuita no n8n Cloud** ou instalar localmente.
2. **Conectar o Google Sheets** como fonte de dados.
3. **Criar um workflow** com disparo agendado.
4. **Filtrar alertas do dia** e do horário atual.
5. **Enviar para Twilio** (WhatsApp/SMS) e serviço de voz.
6. **Registrar o resultado** no histórico.

## Estrutura do fluxo
- **Cron**: executa a cada 1 ou 5 minutos.
- **Google Sheets**: lê as abas `Pacientes` e `Medicamentos e Horários`.
- **Function / Code**: organiza os alertas que vencem naquele momento.
- **Twilio**: envia WhatsApp ou SMS.
- **TTS**: gera o áudio da mensagem.
- **Google Sheets Append**: salva o histórico do envio.

## Campos mínimos da planilha
- ID do alerta
- ID do paciente
- Nome do paciente
- Telefone
- Medicamento
- Dose
- Horário
- Canal de envio
- Status

## Exemplo de regra
Se o horário atual for `07:00`, o workflow deve buscar todos os alertas com horário igual a `07:00` e status `Ativo`.

## Próximos passos
- Criar a planilha no Google Sheets.
- Criar credenciais no n8n.
- Testar o primeiro envio manual.
