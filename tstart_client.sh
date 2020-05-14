python3 thrift/driver/server.py -a 127.0.0.1:8996 --response success --transport framed --protocol binary &
PROC_ID=$!

function finish {
	  kill $PROC_ID
}
trap finish EXIT
./envoy-static -c  envoy.thrift.yaml --concurrency 1 --disable-hot-restart -l trace 
