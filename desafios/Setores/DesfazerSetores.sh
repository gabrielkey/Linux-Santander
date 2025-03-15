#!/bin/bash

# Função para desfazer usuários
function removerUsuario() {
    userdel -r $1
    echo "Deletando o usuário $1."
}

# Deletando diretórios na RAIZ ( / )
rm -rf /publico/ /adm/ /ven/ /sec/

echo "Deletados os diretórios padrão."

# Deletando Grupos
groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC

echo "Deletados os Grupos."

# Deletando Usuários
Usuarios="carlos maria joao debora sebastiana roberto josefina amanda rogerio"

for user in $Usuarios; do
    removerUsuario $user
done
