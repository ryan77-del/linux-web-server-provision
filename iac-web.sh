                                                                                                                                                                              
#!/bin/bash

sleep 1.0
echo "Atualizando sistema[1/4]"
if sudo apt-get update -q > /dev/null 2>&1; then
        echo -e  "Sistema atualizado\n"
else
        echo -e "!!! Erro na atualização !!!\n"
fi

sleep 1.0
echo "Instalando apache[2/4]"
if sudo apt-get update -y -q > /dev/null 2>&1; then
        echo -e "Apache instalado\n"
else
        echo -e "!!! Erro na instalação do apache !!!\n"
fi

sleep 1.0
echo "Verificando status do apache[3/4]"
if [[ $(systemctl is-active apache2) = active ]]; then
        echo -e "Sistema apache está ativo, acesse o site por IP\n"
else
        echo -e "Sistema apache desativado, use o comando systemctl start apache2 para ativar\n"

fi

sleep 1.0
echo "Configurando Permissões[4/4]"
sleep 1.0
sudo chmod 755 /var/www/html && echo "Conteudo web disponiveis para Dono,grupos e outros"
sudo chmod 750 /etc/apache2 &&  echo "Configurações disponiveis para Dono e grupos"
sudo chmod 750 /var/log/apache2 &&  echo "Log disponiveis para Dono e grupos"

