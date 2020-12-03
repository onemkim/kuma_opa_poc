#!/bin/sh
# Run server with node server.js
# Run client with node client.js

#!/bin/sh
nohup node /tmp/ServiceMesh/poc1/server/server.js > /tmp/ServiceMesh/poc1/server.log &
nohup node /tmp/ServiceMesh/poc1/client/client.js > /tmp/ServiceMesh/poc1/client.log &
