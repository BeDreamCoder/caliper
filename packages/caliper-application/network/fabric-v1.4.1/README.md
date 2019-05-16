## Caliper for fabric v1.4.1

Caliper is a blockchain performance benchmark framework, which allows users to test different blockchain solutions with predefined use cases, and get a set of performance test results.

Currently supported fabric v1.4.1 consensus type:
- raft
- kafka
- sbft (developing)
- solo

### Run Benchmark

#### single-host

All predefined benchmarks can be found in benchmark folder. To start your first benchmark, just run this from the folder `packages/caliper-application/scripts`

```
node run-benchmark.js -c ../benchmark/simple/config.yaml -n ../network/fabric-v1.4.1/single-host/XXX/fabric-go.json
```

#### multi-hosts
Multi-hosts mode requires about 10 machines, and each node is deployed to one machine.

##### 1.Configure hosts
Multi-hosts network use docker host mode. Youn need configure hosts firstly.

Example:
```
192.168.0.1     peer0.org1.example.com
192.168.0.2     peer1.org1.example.com
```


#### 2.Configure Env
```
> cd caliper/packages/caliper-application/network/fabric-v1.4.1/multi-hosts

> vim .env
GENESIS_BLOCK=genesis-raft.block
MOUNT_PATH=/tmp/caliper
```


#### 3.Start all nodes at once

Example:
```
> cd caliper/packages/caliper-application/network/fabric-v1.4.1/multi-hosts

docker-compose -f 2org4peer/docker-compose-orderer.yaml up -d
```

Notice: delete all volume dir files when stop network.  

