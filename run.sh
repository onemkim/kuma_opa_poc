sh 01-start-control-plane.sh
sleep 3
sh 02-start-services.sh
sleep 3
sh 03-setup-poc-mesh.sh
sleep 3
sh 04-run-dataplanes.sh
