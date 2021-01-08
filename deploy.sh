if test -f "/etc/systemd/system/api-gateway.service"; then
  systemctl stop api-gateway.service
	echo "stopped service"
else
  cp ./api-gateway.service /etc/systemd/system
  systemctl daemon-reload
  echo "copied service file"
fi

if [ -d "/opt/api-gateway" ]; then
	rm -r /opt/api-gateway
	echo "removed deployment directory"
fi

mkdir -p /var/log/bdotransact
mkdir /opt/api-gateway
echo "created deployment directory"

cp ./target/api-gateway-0.0.1-SNAPSHOT.jar /opt/api-gateway
echo "copied jar to deployment directory"

groupadd -r springboot || true
useradd -m -d /var/lib/springboot -s /sbin/nologin -r -g springboot springboot || true
chown springboot: -R /opt/api-gateway
chown springboot: -R /var/log/bdotransact
sudo -u springboot chmod 700 /opt/api-gateway/api-gateway-0.0.1-SNAPSHOT.jar
echo "modified group and user permissions"

systemctl start api-gateway.service
systemctl enable api-gateway.service
echo "started and enabled service"
