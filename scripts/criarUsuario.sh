#!/bin/bash

useradd guest10 -c "Usuario Convidado" -s /bin/bash -m -p $(openssl passwd -6 Senha123)

passwd -e guest10

# Adicionar em lote os usuários (Copiar e colar)

cat /etc/passwd | egrep guest*