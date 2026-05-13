![Banner Dark Tech](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExcmtyeGMyYTZyMnpjMWQ5dGI1MHd1ODhkNmg5bGJzOXE2Mm1pYXl5NyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Hw0wIr1YL75VC/giphy.gif)




# Infraestrutura como Código (IaC) - Script de Provisionamento 🚀

Este repositório contém um script de automação (`iac1.sh`) desenvolvido para agilizar a criação de estruturas de usuários, grupos e permissões de diretórios em sistemas Linux.

## 📋 Descrição do Projeto

O script foi criado para automatizar o setup inicial de um servidor, garantindo que toda a hierarquia de pastas e acessos seja padronizada, seguindo as melhores práticas de gerenciamento de permissões.

### O que o script realiza:
* **Limpeza Preventiva**: Remove usuários, grupos e diretórios de execuções anteriores para evitar conflitos no sistema.
* **Gestão de Diretórios**: Cria pastas estruturadas (`/publico`, `/adm`, `/ven`, `/sec`) na raiz do sistema.
* **Gestão de Grupos**: Provisiona os grupos departamentais `GRP_ADM`, `GRP_VEN` e `GRP_SEC`.
* **Provisionamento de Usuários**: 
    * Cria 9 usuários com shells padrão `/bin/bash`.
    * Utiliza o `openssl` para gerar senhas criptografadas.
    * Associa automaticamente cada usuário ao seu respectivo grupo.
* **Segurança e Permissões**: 
    * Define o `root` como dono de todos os diretórios.
    * Aplica permissões restritivas (`770`) para garantir que apenas membros de um grupo acessem suas respectivas pastas.
    * Configura a pasta `/publico` com acesso total (`777`) para todos os usuários.

## 🛠️ Tecnologias Utilizadas

* **Shell Script** (Bash)
* **Ubuntu Linux**
* **OpenSSL** (para encriptação de credenciais)

## 🚀 Como Executar e Permissões

Para que o script funcione corretamente no seu sistema, siga os passos abaixo para garantir as permissões de execução necessárias.

### 1. Garantir Permissão de Execução
No Linux, arquivos `.sh` recém-criados muitas vezes não têm permissão para serem executados como programas. Use o comando `chmod` para alterar isso:
```bash
chmod +x iac1.sh
