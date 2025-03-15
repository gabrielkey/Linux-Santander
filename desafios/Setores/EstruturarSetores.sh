#!/bin/bash

# Função para criar usuários
function criarUsuario() {
    useradd $1 -c "$2" -s /bin/bash -m -p $(openssl passwd -6 Senha123)
    passwd -e $1

    echo "Criado o usuário $1 com a senha padrão(Senha123)."
}

# Criando diretórios na RAIZ ( / )
mkdir /publico/ /adm/ /ven/ /sec/

echo "Criados os diretórios padrão."

# Adicionando Grupos 
groupadd GRP_ADM 
groupadd GRP_VEN 
groupadd GRP_SEC

echo "Criando Grupos."

# Criando Usuários
Usuarios="carlos maria joao debora sebastiana roberto josefina amanda rogerio"

for user in $Usuarios; do
    criarUsuario $user "$user"

    case $user in
        carlos|maria|joao)
            usermod -G GRP_ADM $user
            ;;
        debora|sebastiana|roberto)
            usermod -G GRP_VEN $user
            ;;
        josefina|amanda|rogerio)
            usermod -G GRP_SEC $user
            ;;
    esac
done

# Permissões
chmod 777 /publico/
chmod 770 /adm/
chmod 770 /ven/
chmod 770 /sec/

chown root:GRP_ADM /adm/
chown root:GRP_VEN /ven/
chown root:GRP_SEC /sec/

echo "Definindo permissões de Usuários e Grupos."
