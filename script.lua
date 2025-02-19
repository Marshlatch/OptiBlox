-- 📌 Carrega a Rayfield UI
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/sannin9000/Rayfield/main/source.lua"))()
end)

if not success or not Rayfield then
    warn("⚠ Erro ao carregar Rayfield UI. Verifique sua conexão ou tente outro exploit!")
    return
end

-- 📌 Criando a Interface Principal
local Window = Rayfield:CreateWindow({
   Name = "OptiBlox Default",
   LoadingTitle = "Carregando...",
   LoadingSubtitle = "By Marshlatch",
   ConfigurationSaving = { Enabled = false },
   Discord = { Enabled = false }
})

-- 📌 Aba de Otimizações
local Main = Window:CreateTab("Otimizações", 4483362458)

Main:CreateToggle({
   Name = "Remover Partículas",
   CurrentValue = false,
   Flag = "RemoverParticulas",
   Callback = function(state)
       for _, v in pairs(game:GetDescendants()) do
           if v:IsA("ParticleEmitter") or v:IsA("Trail") then
               v.Enabled = not state
           end
       end
   end
})

Main:CreateToggle({
   Name = "Desativar Sombras",
   CurrentValue = false,
   Flag = "DesativarSombras",
   Callback = function(state)
       game.Lighting.GlobalShadows = not state
   end
})

Main:CreateToggle({
   Name = "Remover Texturas",
   CurrentValue = false,
   Flag = "RemoverTexturas",
   Callback = function(state)
       for _, v in pairs(game:GetDescendants()) do
           if v:IsA("Decal") or v:IsA("Texture") then
               v:Destroy()
           end
       end
   end
})

-- 📌 Aba de Performance
local Performance = Window:CreateTab("Performance", 4483362458)

Performance:CreateToggle({
   Name = "Remover Acessórios do Avatar",
   CurrentValue = false,
   Flag = "RemoverAcessorios",
   Callback = function(state)
       for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
           if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") then
               v:Destroy()
           end
       end
   end
})

Performance:CreateToggle({
   Name = "Modo Baixa Latência",
   CurrentValue = false,
   Flag = "ModoBaixaLatencia",
   Callback = function(state)
       game.NetworkSettings.IncomingReplicationLag = state and 0 or 0.05
   end
})

-- 📌 Aba de Perfis Rápidos
local Profiles = Window:CreateTab("Perfis", 4483362458)

Profiles:CreateButton({
   Name = "Modo FPS Boost",
   Callback = function()
       game.Lighting.GlobalShadows = false
       for _, v in pairs(game:GetDescendants()) do
           if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Decal") or v:IsA("Texture") then
               v:Destroy()
           end
       end
       game.Players.LocalPlayer.Character.Archivable = false
   end
})

Rayfield:Notify({
   Title = "OptiBlox Carregado!",
   Content = "A interface foi carregada com sucesso.",
   Duration = 5
})