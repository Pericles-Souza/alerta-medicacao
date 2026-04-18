# ============================================
#   ALERTA DE MEDICACAO - Setup GitHub
#   Execute no PowerShell do VS Code
# ============================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "  ALERTA DE MEDICACAO - Setup GitHub" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

# Verificar Git
try {
    $gitVersion = git --version
    Write-Host "[OK] $gitVersion encontrado!" -ForegroundColor Green
} catch {
    Write-Host "[ERRO] Git nao encontrado! Baixe em: https://git-scm.com/downloads" -ForegroundColor Red
    exit 1
}

# Coletar dados
Write-Host ""
$GH_USER  = Read-Host "Digite seu usuario do GitHub (ex: peu_w)"
$GH_EMAIL = Read-Host "Digite seu email do GitHub"
$GH_REPO  = Read-Host "Nome do repositorio no GitHub (ex: alerta-medicacao)"

# Configurar identidade Git
git config --global user.name  $GH_USER
git config --global user.email $GH_EMAIL
Write-Host "[OK] Identidade Git configurada!" -ForegroundColor Green

# Inicializar repositório
Write-Host ""
Write-Host "[1/5] Iniciando repositorio Git..." -ForegroundColor Cyan
git init
git checkout -b main 2>$null
if ($LASTEXITCODE -ne 0) { git branch -M main }

# Criar estrutura de pastas
New-Item -ItemType Directory -Force -Path "flows" | Out-Null
New-Item -ItemType Directory -Force -Path "docs"  | Out-Null
New-Item -ItemType File      -Force -Path "flows\.gitkeep" | Out-Null
New-Item -ItemType File      -Force -Path "docs\.gitkeep"  | Out-Null

# .gitignore
@"
.DS_Store
Thumbs.db
*.log
node_modules/
.env
"@ | Out-File -Encoding utf8 ".gitignore"

Write-Host "[OK] Estrutura de pastas criada!" -ForegroundColor Green

# Adicionar arquivos
Write-Host "[2/5] Adicionando arquivos ao Git..." -ForegroundColor Cyan
git add .
Write-Host "[OK] Arquivos adicionados!" -ForegroundColor Green

# Primeiro commit
Write-Host "[3/5] Criando primeiro commit..." -ForegroundColor Cyan
git commit -m "feat: prototipo inicial do sistema de alerta de medicacao via WhatsApp, SMS e audio"
Write-Host "[OK] Commit criado!" -ForegroundColor Green

# Instruções GitHub
Write-Host ""
Write-Host "============================================" -ForegroundColor Yellow
Write-Host "  AGORA: Crie o repositorio no GitHub" -ForegroundColor Yellow
Write-Host "============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  1. Acesse: https://github.com/new" -ForegroundColor White
Write-Host "  2. Nome do repositorio: $GH_REPO" -ForegroundColor White
Write-Host "  3. Deixe PRIVADO ou PUBLICO (sua escolha)" -ForegroundColor White
Write-Host "  4. NAO marque 'Add README' (ja temos um)" -ForegroundColor White
Write-Host "  5. Clique em 'Create repository'" -ForegroundColor White
Write-Host ""
Read-Host "Pressione ENTER depois de criar o repositorio no GitHub"

# Conectar e enviar
Write-Host "[4/5] Conectando ao GitHub..." -ForegroundColor Cyan
$remoteUrl = "https://github.com/$GH_USER/$GH_REPO.git"
git remote add origin $remoteUrl
Write-Host "[OK] Remote configurado: $remoteUrl" -ForegroundColor Green

Write-Host "[5/5] Enviando para o GitHub..." -ForegroundColor Cyan
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "  PRONTO! Repositorio enviado!" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Acesse: https://github.com/$GH_USER/$GH_REPO" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  Para deixar o prototipo ONLINE (GitHub Pages):" -ForegroundColor Yellow
    Write-Host "  1. Va em Settings > Pages" -ForegroundColor White
    Write-Host "  2. Source: main / root" -ForegroundColor White
    Write-Host "  3. Save" -ForegroundColor White
    Write-Host "  4. Link: https://$GH_USER.github.io/$GH_REPO/alerta-medicacao.html" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "[ERRO] Falha no push. Verifique:" -ForegroundColor Red
    Write-Host "  - O repositorio foi criado no GitHub?" -ForegroundColor Yellow
    Write-Host "  - Usuario e nome do repo estao corretos?" -ForegroundColor Yellow
    Write-Host "  - Voce esta autenticado no Git?" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Para autenticar rode:" -ForegroundColor White
    Write-Host "  git credential-manager configure" -ForegroundColor Cyan
}

Write-Host ""
Read-Host "Pressione ENTER para fechar"
