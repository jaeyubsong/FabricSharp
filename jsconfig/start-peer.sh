set -ev
# don't rewrite paths for Windows Git Bash users
export MSYS_NO_PATHCONV=1
docker-compose -f docker-compose-peer.yml down
docker-compose -f docker-compose-peer.yml up -d fast.org1.jjo.kr
export FABRIC_START_TIMEOUT=10
#echo ${FABRIC_START_TIMEOUT}
sleep ${FABRIC_START_TIMEOUT}
# Create the channel
# docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.jjo.kr/msp" fast.org1.jjo.kr peer channel fetch config -o orderer0.jjo.kr:7050 -c mychannel
# docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.jjo.kr/msp" fast.org1.jjo.kr peer channel join -b mychannel_config.block