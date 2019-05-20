#!/usr/bin/env bash

# Prior to generation, need to run:
# export FABRIC_CFG_PATH=<path to directory>

# The below assumes you have the relevant code available to generate the cryto-material
# bin/cryptogen generate --config=./crypto-config.yaml
bin/configtxgen -profile TwoOrgsOrdererGenesis -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID mychannel
