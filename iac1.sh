#!/bin/bash

echo "Limpando o sistema..."
# Excluir diretórios, grupos e usuários anteriores
userdel -r -f carlos
userdel -r -f maria
# ... (repetir para todos os usuários listados)
groupdel GRP_ADM
# ... (repetir para todos os grupos)
rm -rf /adm /ven /sec /publico

echo "Criando diretórios..."
# Dono será o root por padrão ao criar com sudo
mkdir /publico /adm /ven /sec

echo "Criando grupos de usuários..."
# Definição de grupos
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários e adicionando aos grupos..."
# Criando e associando aos respectivos grupos
useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

echo "Especificando permissões dos diretórios..."
# Definindo o dono como root
chown root:root /publico /adm /ven /sec

# Grupos específicos com permissão total em suas pastas
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

# Ajustando permissões (chmod <dono><grupo><outros>)
chmod 777 /publico   # Todos podem tudo
chmod 770 /adm       # Grupo ADM pode tudo, o resto nada
chmod 770 /ven       # Grupo VEN pode tudo, o resto nada
chmod 770 /sec       # Grupo SEC pode tudo, o resto nada

echo "Finalizado!"
