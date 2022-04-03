# brand-connect

Connects your brand to hosted checkout pages and serves payment UIs under your own domain.

## Configuration

The container binds port https/443 and http/80. You may use your own SSL certificate by mounting it to `/ssl.pem`, otherwise https will be served with an invalid dummy certificate.  


#### Environment variables:

`CQ_BRANDING_KEY` Your personal token provided by Coinqvest, which is used to customize to your checkout pages.


## Examples

### Run with an invalid SSL certificate
```
docker run -p 443:443 -e CQ_BRANDING_KEY=demo coinqvest/brand-connect:latest
```

### Run with your own SSL certificate 
```
docker run -v /path/to/ssl.pem:/ssl.pem -p 443:443 -e CQ_BRANDING_KEY=demo coinqvest/brand-connect:latest
```

### Run without SSL
```
docker run -p 80:80 -e CQ_BRANDING_KEY=demo coinqvest/brand-connect:latest
```

### Kubernetes 
The configuration file in examples/kubernetes.yaml shows a very basic example setup without SSL, you'll need to terminate SSL in your ingress depending on your environment.   
