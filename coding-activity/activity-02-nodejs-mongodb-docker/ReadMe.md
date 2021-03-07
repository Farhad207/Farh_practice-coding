<h1 id="my-custom-anchor-name">
  Build a Node.js Application and connect it with mongoDB
</h1>

* Run the mongo DB as a container
```javascript
docker run -d -v mongodata:/data/db -p 27017:27017 --name mongodb -d mongo
sha256:51f6fdbfc622d91e276ade7e6cf6491aa36ff2bd9b158dadb732f9e4a05f33ad
```

* checking if the mongodb is running 
```javascript
docker ps -a | grep mongo
68331d1f97ad   mongo                      "docker-entrypoint.s…"   16 minutes ago   Up 16 minutes               0.0.0.0:27017->27017/tcp   mongodb
```

