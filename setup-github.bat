@echo off
title Configurando repositório - Alerta de Medicação
color 0A

echo ============================================
echo   ALERTA DE MEDICACAO - Setup GitHub
echo ============================================
echo.

:: Verificar se Git está instalado
git --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo [ERRO] Git nao encontrado!
    echo Baixe em: https://git-scm.com/downloads
    pause
    exit /b 1
)
echo [OK] Git encontrado!

:: Solicitar dados do usuario
echo.
set /p GH_USER=Digite seu usuario do GitHub (ex: joaosilva): 
set /p GH_EMAIL=Digite seu email do GitHub: 
set /p GH_REPO=Nome do repositorio (ex: alerta-medicacao): 

:: Configurar Git
git config --global user.name "%GH_USER%"
git config --global user.email "%GH_EMAIL%"

:: Inicializar repositório
echo.
echo [1/5] Iniciando repositorio Git local...
git init
git checkout -b main

:: Adicionar arquivos
echo [2/5] Adicionando arquivos...
git add alerta-medicacao.html
git add README.md

:: Criar pastas e arquivos base
mkdir flows 2>nul
mkdir docs 2>nul
echo. > flows\.gitkeep
echo. > docs\.gitkeep
git add flows/.gitkeep docs/.gitkeep

:: Primeiro commit
echo [3/5] Fazendo primeiro commit...
git commit -m "feat: prototipo inicial do sistema de alerta de medicacao"

:: Conectar ao GitHub
echo [4/5] Conectando ao GitHub...
echo.
echo ATENCAO: Voce precisa criar o repositorio no GitHub antes!
echo Acesse: https://github.com/new
echo Nome sugerido: %GH_REPO%
echo Nao marque "Add README" (ja temos um)
echo.
pause

git remote add origin https://github.com/%GH_USER%/%GH_REPO%.git

:: Push
echo [5/5] Enviando para o GitHub...
git push -u origin main

echo.
echo ============================================
echo   PRONTO! Repositorio criado com sucesso!
echo ============================================
echo.
echo Acesse: https://github.com/%GH_USER%/%GH_REPO%
echo.
echo Para ativar o GitHub Pages (protótipo online):
echo 1. Va em Settings ^> Pages
echo 2. Source: main / root
echo 3. Save
echo.
pause
