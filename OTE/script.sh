#!/bin/bash
echo "#########################################"
echo "#                                       #"
echo "#            WELCOME TO OTE             #"
echo "#                                       #"
echo "#########################################"

echo "Creating Channels"
echo $numChannels
for (( i=1; i<=${numChannels}; i++ ))
do
       peer channel create -o orderer.example.com:7050 -c mychannel$i -f ../config/channel-artifacts/mychannel$i.tx --tls true --cafile /etc/hyperledger/fabric/artifacts/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
done
go build
sleep 10
go test -run $TESTCASE -timeout=90m
mv ote-*.log ote.log
