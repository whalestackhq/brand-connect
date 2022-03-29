# checkout-proxy

## Configuration

The checkout-proxy binds to container port https/443 and http/80. You may use your own SSL certificate by mounting it to `/ssl.pem`, otherwise https will be served with an invalid dummy certificate.  


####Environment variables:

`CQKEY` Your personal token provided by Coinqvest, which is used to customize to your checkout pages.


## Examples

### Run with an invalid SSL certificate
```
docker run -p 443:443 -e CQKEY=demo coinqvest/checkout-proxy:latest
```

### Run with your own SSL certificate 
```
docker run -v /path/to/ssl.pem:/ssl.pem -p 443:443 -e CQKEY=demo coinqvest/checkout-proxy:latest
```

### Run without SSL
```
docker run -p 80:80 -e CQKEY=demo coinqvest/checkout-proxy:latest
```

### Kubernetes 
The configuration file in examples/kubernetes.yaml shows an example setup without SSL, you'll need to terminate SSL in your ingress depending on your environment.   