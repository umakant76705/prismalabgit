#!/bin/bash
cont_count=$1
echo "creating $cont_count containers.."
sleep 2;
for i in `seq $cont_count`
do
	echo "=============================="
    echo "Creating www.prismalabtest$i container.."
    sleep 1
    docker run --name www.prismalabtest$i -d -it umakant76705/kantprisma-img /bin/bash
    echo "www.prismalabtest$i container has been created!"
	echo "=============================="
done
docker inspect --format {{.NetworkSettings.Networks.bridge.IPAddress}} `docker ps -q` > IPs.txt
