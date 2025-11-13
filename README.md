
<div align="center">

# 🍉 Emprego de Plantação de Melancia  
### FiveM Standalone • vRP • QBCore Compatible  

![Version](https://img.shields.io/badge/version-1.0.0-green?style=for-the-badge)
![Framework](https://img.shields.io/badge/framework-vRP%20%7C%20QBCore-blue?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-lightgrey?style=for-the-badge)
![Status](https://img.shields.io/badge/status-stable-success?style=for-the-badge)

Desenvolvido por **DOIZZP** 🧙‍♂️  

</div>

---

## 📘 Sobre o Projeto

Este script adiciona um **sistema de colheita de melancias** totalmente funcional no FiveM 🍉  
Perfeito para criar **empregos agrícolas**, **rotas de colheita** ou **sistemas de sobrevivência** em servidores RP.

Compatível tanto com **vRP** quanto com **QBCore**, podendo ser facilmente adaptado a outros frameworks.

---

## ⚙️ Funcionalidades

✅ Spawn automático das plantas no mapa  
✅ Colheita com animação e tempo configurável  
✅ Texto 3D interativo (“[E] Colher Melancia”)  
✅ Reaparecimento automático dos objetos  
✅ Entrega direta do item no inventário  
✅ Código leve e otimizado (thread com sleep dinâmico)  

---

## 🧩 Estrutura de Arquivos

```
plantacao_melancia/
│
├── fxmanifest.lua        # Metadados e carregamento de scripts
├── config.lua            # Configurações e coordenadas da plantação
├── client.lua            # Lógica visual e interação do jogador
└── server.lua            # Entrega do item e integração com framework
```

---

## 🛠️ Instalação

1. Coloque a pasta **plantacao_melancia** dentro de `resources/` no seu servidor.  
2. Adicione ao seu `server.cfg`:
   ```cfg
   ensure plantacao_melancia
   ```

3. Configure o `server.lua` conforme o framework usado:

### ➤ vRP
Já vem configurado:
```lua
local user_id = vRP.getUserId(src)
vRP.giveInventoryItem(user_id, "watermelon", 1, true)
```

### ➤ QBCore
Substitua dentro do `server.lua`:
```lua
local Player = QBCore.Functions.GetPlayer(src)
Player.Functions.AddItem("watermelon", 1)
```

---

## ⚙️ Configuração (`config.lua`)

Você pode ajustar todos os parâmetros da plantação facilmente:

| Parâmetro | Descrição |
|------------|------------|
| `collectDuration` | Tempo da animação de colheita (ms) |
| `collectCoords` | Coordenadas onde as melancias aparecem |
| `collectProp` | Modelo 3D usado no GTA (ex: `prop_watermelon`) |
| `respawnTime` | Tempo até a planta reaparecer (em segundos) |
| `deliveryItem` | Nome do item entregue ao jogador |

Exemplo:
```lua
["PlantacaoMelancia"] = {
    ["collectProp"] = "prop_watermelon",
    ["collectDuration"] = 8000,
    ["respawnTime"] = 300,
    ["deliveryItem"] = "watermelon"
}
```

---

## 🎮 Como Funciona

1. O servidor spawna as plantas nas coordenadas definidas.  
2. O jogador se aproxima e vê o texto interativo:  
   > **[E] Colher Melancia**
3. Ao pressionar `E`, toca a animação configurada.  
4. O item é entregue automaticamente no inventário.  
5. A planta é removida e reaparece após o tempo configurado.

---

## 🧰 Logs e Otimização

- Modelos são carregados de forma assíncrona.  
- Threads usam **sleep dinâmico** para economia de recursos.  
- Textos 3D só aparecem quando o jogador está próximo.  
- Respawn automático individual por ponto de colheita.  

---

## 🧾 Requisitos

- ✅ **FiveM Build Cerulean**  
- ✅ **vRP** ou **QBCore**  
- ⚙️ Permissão para editar o `server.cfg`  

---

## 📍 Local da Plantação

```
-2107.92, 7147.42, 29.47
```

As melancias reaparecem a cada **5 minutos (300s)**.

---

## 🪵 Log de Atualizações

### 🆕 v1.0.0
- Primeira versão estável  
- Compatível com vRP e QBCore  
- Sistema completo de colheita e respawn automático  

---

## 👨‍💻 Autor

**DOIZZP**  
💬 Projeto desenvolvido para **EVOM GG**  
📍 Feito com 🖤 e café ☕  

📎 **Contato:**  
- Discord: [poolshev.exe](https://discord.gg/C9j2pajAQm)  
- GitHub: [github.com/poolshev](https://github.com/poolshev)

---

## ⚖️ Licença

Distribuído sob licença **MIT**.  
Você pode editar, modificar e redistribuir, desde que mantenha os créditos originais.

---

<div align="center">
Feito com 🖤 por <b>DOIZZP</b>  
</div>
