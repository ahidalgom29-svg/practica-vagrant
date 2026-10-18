#!/usr/bin/env bash
apt-get update -y
apt-get install -y apache2

systemctl enable apache2
systemctl start apache2

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Servidor Web Vagrant</title>
</head>
<body>
    <h1>Servidor Apache Desplegado con Éxito</h1>
    <p><b>Estudiante:</b> Ángel Hidalgo Morales</p>
    <p><b>Hostname:</b> $(hostname)</p>
    <p><b>IPs:</b> $(hostname -I)</p>
</body>
</html>
EOF
