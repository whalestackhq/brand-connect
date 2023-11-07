# Brand Connect  Container

![Brand Connect](https://www.coinqvest.com/en/view-blog-image/id/dc6168685aa5)

Connects your brand to hosted checkout pages and serves COINQVEST payment UIs under your own domain. Brand Connect customizes hosted checkouts to your own brand, web domain, custom logo, images, and fully skinned UI. Brand Connect can run on coinqvest.com or on your own web domain, which is activated through your DNS settings pointed at a docker container hosted in your own deployment. See below.

## Pre-Requisites

* Enable and configure Brand Connect in your [account settings](https://www.coinqvest.com/en/account-settings#brandingConfigs) 
* Obtain your `WS_BRANDING_KEY` by enabling Brand Connect (see step above)
* Apply behavior setting 1 or 2 during initial setup and specify your desired "custom web domain"

## Configuration

The container binds port https/443 and http/80. You may use your own SSL certificate by mounting it to `/ssl.pem`. The PEM file must contain a [combined](https://stackoverflow.com/questions/991758/how-to-get-pem-file-from-key-and-crt-files) public and private key. If no PEM file is mounted, https will be served with an invalid dummy certificate.

Activate Brand Connect by pointing the "custom web domain" specified in your [account settings](https://www.coinqvest.com/en/account-settings#brandingConfigs) at the IP address of the docker container via your DNS config. Once up and running you can block access via coinqvest.com by applying behavior setting 3 (checkouts on coinqvest.com redirect the user to your custom web domain) or 4 (checkouts on coinqvest.com are blocked and only accessible via your custom web domain) in your account.

#### Environment variables:

`WS_BRANDING_KEY` Your branding key as given by COINQVEST (see your [account settings](https://www.coinqvest.com/en/account-settings#brandingConfigs)).


## Examples

### Run with an invalid SSL certificate
```
docker run -p 443:443 -e WS_BRANDING_KEY=demo coinqvest/brand-connect:latest
```

### Run with your own SSL certificate 
```
docker run -v /path/to/ssl.pem:/ssl.pem -p 443:443 -e WS_BRANDING_KEY=demo coinqvest/brand-connect:latest
```

### Run without SSL
```
docker run -p 80:80 -e CQ_BRANDING_KEY=demo coinqvest/brand-connect:latest
```

### Kubernetes 
The configuration file in examples/kubernetes.yaml shows a very basic example setup without SSL, you'll need to terminate SSL in your ingress depending on your environment.   
