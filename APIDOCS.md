## Generate Payment21® JSON/REST API documentation with Aglio in Docker container

**1. Clone this repository somewhere to local filesystem to "apidocs" folder**

`> git clone https://github.com/payment21/payment-gateway-apidocs.git`

**2. Create or run Docker virtualbox "apidocs"**

`> docker-machine create --driver virtualbox apidocs`

or 

`> docker-machine start apidocs`

`> docker-machine ls`

`> FOR /f "tokens=*" %i IN ('docker-machine env apidocs') DO %i`

`> docker-compose build`

`> docker-compose up -d`

`> docker ps`

The container name should be "apidocs_genapi_1".

**3. Make local changes**

Edit API Blueprint file p21RestApi.apib or other resources (*.html, images)

**4. Copy local changes to Docker container**

`> docker cp ./p21RestApi/. apidocs_genapi_1:/opt/apidocs`

**5. Generate API in Docker Container**

`> docker exec apidocs_genapi_1 bash /opt/apidocs/generate-apidocs.sh`

**6. Copy generated documentation form Docker to local filesystem**

`> docker cp apidocs_genapi_1:/opt/apidocs/.  ./p21RestApi`

**7. Commit and push changes to repository**

`> git add .`

`> git commit -a -m "Description of changes ..."`

`> git push`

**8. Run automate deployment Jengins job to deploy APIDOCS to GitHub Pages**