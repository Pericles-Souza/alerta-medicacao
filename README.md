# 💊 Alerta de Medicação

Sistema de alertas de horário para medicação via **WhatsApp**, **SMS** e **áudio acessível** — pensado para pessoas com deficiência auditiva e baixo letramento.

---

## 🎯 Objetivo

Avisar pacientes no horário certo de tomar seus medicamentos através de múltiplos canais de comunicação, garantindo acessibilidade para todos os perfis de usuário.

---

## ✅ Funcionalidades

- 📱 Envio de alerta via **WhatsApp**
- 💬 Envio de alerta via **SMS**
- 🔊 Mensagem de **áudio** gerada automaticamente (acessibilidade)
- 🕐 Máscara inteligente de horário
- 👥 Cadastro de pacientes e responsáveis
- 🌙 Tema claro e escuro
- 📋 Painel de alertas agendados

---

## 🛠️ Stack Técnico (MVP Gratuito)

| Função              | Ferramenta        | Custo     |
|---------------------|-------------------|-----------|
| Protótipo visual    | HTML + CSS + JS   | Gratuito  |
| Automação/agendamento | n8n Cloud       | Gratuito  |
| WhatsApp + SMS      | Twilio Trial      | Gratuito  |
| Geração de áudio    | ElevenLabs Free   | Gratuito  |
| Banco de dados      | Google Sheets     | Gratuito  |

---

## 🗂️ Estrutura do Projeto

```
alerta-medicacao/
├── alerta-medicacao.html   ← Protótipo navegável
├── flows/                  ← Fluxos de automação n8n (JSON)
├── docs/                   ← Documentação e user stories
└── README.md
```

---

## 🚀 Como usar o protótipo

1. Faça o download ou clone este repositório
2. Abra o arquivo `alerta-medicacao.html` no navegador
3. Preencha os dados do paciente e medicamento
4. Clique em **Salvar lembrete** ou **Testar notificação**

---

## 📍 Roadmap

- [x] Protótipo navegável
- [x] Máscara de horário inteligente
- [x] Tema claro/escuro
- [ ] Integração com Google Sheets
- [ ] Automação com n8n
- [ ] Envio real via Twilio (WhatsApp + SMS)
- [ ] Geração de áudio com ElevenLabs
- [ ] App mobile / PWA

---

## 🤝 Contribuições

Projeto em fase de validação com pacientes reais. Sugestões e feedbacks são muito bem-vindos!

---

## 📄 Licença

MIT License — livre para uso e adaptação.
