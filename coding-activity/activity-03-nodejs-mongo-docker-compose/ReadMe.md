<h1 id="my-custom-anchor-name">
  Node.js Application and connect it with mongoDB using docker-compose
</h1>

```javascript
docker-compose up
Creating network "app_end" with driver "bridge"
Pulling mongodb (mongo:)...
latest: Pulling from library/mongo
92dc2a97ff99: Pull complete
be13a9d27eb8: Pull complete
c8299583700a: Pull complete
f61ed17142e4: Pull complete
bed7676d225b: Pull complete
ba553bcfc69c: Pull complete
e5046b6c236f: Pull complete
80191acfded2: Pull complete
d41d63fc76cc: Pull complete
5605b8c2e9f7: Pull complete
e8b16825b485: Pull complete
3d40ccce1309: Pull complete
Digest: sha256:51f6fdbfc622d91e276ade7e6cf6491aa36ff2bd9b158dadb732f9e4a05f33ad
Status: Downloaded newer image for mongo:latest
Building app
Step 1/6 : FROM node:current-buster-slim
 ---> d200eefa1908
Step 2/6 : RUN mkdir -p /code
 ---> Using cache
 ---> b48971fe3c6a
Step 3/6 : WORKDIR /code
 ---> Using cache
 ---> 7f59d8fc4788
Step 4/6 : ADD . /code
 ---> 6e1d7abfcecf
Step 5/6 : RUN npm install yarn &&     yarn install
 ---> Running in b0978fde092b

added 1 package, and audited 115 packages in 2s

3 vulnerabilities (2 low, 1 high)

To address all issues, run:
  npm audit fix

Run `npm audit` for details.
npm notice
npm notice New patch version of npm available! 7.6.0 -> 7.6.1
npm notice Changelog: <https://github.com/npm/cli/releases/tag/v7.6.1>
npm notice Run `npm install -g npm@7.6.1` to update!
npm notice
yarn install v1.22.5
warning package-lock.json found. Your project contains lock files generated by tools other than Yarn. It is advised not to mix package managers in order to avoid resolution inconsistencies caused by unsynchronized lock files. To clear this warning, remove package-lock.json.
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Saved lockfile.
Done in 4.08s.
Removing intermediate container b0978fde092b
 ---> 5e32ae002f07
Step 6/6 : CMD [ "yarn", "start" ]
 ---> Running in e1faf125859b
Removing intermediate container e1faf125859b
 ---> 7c113c789246
Successfully built 7c113c789246
Successfully tagged app_app:latest
WARNING: Image for service app was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating mongodb ... done
Creating todo    ... done
Attaching to mongodb, todo
mongodb    | {"t":{"$date":"2021-03-07T09:30:26.160+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
mongodb    | {"t":{"$date":"2021-03-07T09:30:26.171+00:00"},"s":"W",  "c":"ASIO",     "id":22601,   "ctx":"main","msg":"No TransportLayer configured during NetworkInterface startup"}
mongodb    | {"t":{"$date":"2021-03-07T09:30:26.171+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set tcpFastOpenServer, tcpFastOpenClient, and tcpFastOpenQueueSize."}
mongodb    | {"t":{"$date":"2021-03-07T09:30:26.172+00:00"},"s":"I",  "c":"STORAGE",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":1,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"c24e048069f2"}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:26.172+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"4.4.4","gitVersion":"8db30a63db1a9d84bdcad0c83369623f708e0397","openSSLVersion":"OpenSSL 1.1.1  11 Sep 2018","modules":[],"allocator":"tcmalloc","environment":{"distmod":"ubuntu1804","distarch":"x86_64","target_arch":"x86_64"}}}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:26.172+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"18.04"}}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:26.172+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"*"}}}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:26.175+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
mongodb    | {"t":{"$date":"2021-03-07T09:30:26.175+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=256M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,archive=true,path=journal,compressor=snappy),file_manager=(close_idle_time=100000,close_scan_interval=10,close_handle_minimum=250),statistics_log=(wait=0),verbose=[recovery_progress,checkpoint_progress,compact_progress],"}}
todo       | yarn run v1.22.5
todo       | $ node app.js
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.627+00:00"},"s":"I",  "c":"STORAGE",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":"[1615109427:627354][1:0x7fc022592ac0], txn-recover: [WT_VERB_RECOVERY | WT_VERB_RECOVERY_PROGRESS] Set global recovery timestamp: (0, 0)"}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.628+00:00"},"s":"I",  "c":"STORAGE",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":"[1615109427:628013][1:0x7fc022592ac0], txn-recover: [WT_VERB_RECOVERY | WT_VERB_RECOVERY_PROGRESS] Set global oldest timestamp: (0, 0)"}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.637+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1462}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.638+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.654+00:00"},"s":"I",  "c":"STORAGE",  "id":4366408, "ctx":"initandlisten","msg":"No table logging settings modifications are required for existing WiredTiger tables","attr":{"loggingEnabled":true}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.655+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.663+00:00"},"s":"W",  "c":"CONTROL",  "id":22120,   "ctx":"initandlisten","msg":"Access control is not enabled for the database. Read and write access to data and configuration is unrestricted","tags":["startupWarnings"]}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.672+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"admin.system.version","uuidDisposition":"provided","uuid":{"uuid":{"$uuid":"87976c76-592e-458b-b064-bc6b506f02bc"}},"options":{"uuid":{"$uuid":"87976c76-592e-458b-b064-bc6b506f02bc"}}}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.686+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"namespace":"admin.system.version","index":"_id_","commitTimestamp":{"$timestamp":{"t":0,"i":0}}}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.687+00:00"},"s":"I",  "c":"COMMAND",  "id":20459,   "ctx":"initandlisten","msg":"Setting featureCompatibilityVersion","attr":{"newVersion":"4.4"}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.689+00:00"},"s":"I",  "c":"STORAGE",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.692+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"local.startup_log","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"60139126-e48b-4492-96a2-123751780179"}},"options":{"capped":true,"size":10485760}}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.705+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"namespace":"local.startup_log","index":"_id_","commitTimestamp":{"$timestamp":{"t":0,"i":0}}}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.706+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.708+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.710+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"0.0.0.0"}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.710+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.724+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"LogicalSessionCacheRefresh","msg":"createCollection","attr":{"namespace":"config.system.sessions","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"4d45f1b2-e777-4cf6-a120-5975f59490b5"}},"options":{}}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.725+00:00"},"s":"I",  "c":"CONTROL",  "id":20712,   "ctx":"LogicalSessionCacheReap","msg":"Sessions collection is not set up; waiting until next sessions reap interval","attr":{"error":"NamespaceNotFound: config.system.sessions does not exist"}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.743+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"namespace":"config.system.sessions","index":"_id_","commitTimestamp":{"$timestamp":{"t":0,"i":0}}}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.744+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"namespace":"config.system.sessions","index":"lsidTTLIndex","commitTimestamp":{"$timestamp":{"t":0,"i":0}}}}
todo       | (node:28) Warning: Accessing non-existent property 'count' of module exports inside circular dependency
todo       | (Use `node --trace-warnings ...` to show where the warning was created)
todo       | (node:28) Warning: Accessing non-existent property 'findOne' of module exports inside circular dependency
todo       | (node:28) Warning: Accessing non-existent property 'remove' of module exports inside circular dependency
todo       | (node:28) Warning: Accessing non-existent property 'updateOne' of module exports inside circular dependency
todo       | listening on port 5000
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.956+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.19.0.3:43234","connectionId":1,"connectionCount":1}}
mongodb    | {"t":{"$date":"2021-03-07T09:30:27.969+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn1","msg":"client metadata","attr":{"remote":"172.19.0.3:43234","client":"conn1","doc":{"driver":{"name":"nodejs-core","version":"3.3.3"},"os":{"type":"Linux","name":"linux","architecture":"x64","version":"5.4.0-1038-aws"},"platform":"Node.js v15.11.0, LE"}}}
todo       | MongoDB connected...
```
* checking the docker containers 

```javascript 
docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                      NAMES
b1aa44d0d384   app_app   "docker-entrypoint.s…"   9 minutes ago   Up 9 minutes   0.0.0.0:5000->5000/tcp     todo
c24e048069f2   mongo     "docker-entrypoint.s…"   9 minutes ago   Up 9 minutes   0.0.0.0:27017->27017/tcp   mongodb
```

* application running using docker-compose
![](/images/coding-activity/activity-03-nodejs-mongo-docker-compose/using_docker_compose.PNG)

* Application connected to mongodb
![](/images/coding-activity/activity-03-nodejs-mongo-docker-compose/MongoDB_connected_to_todo_nodejs_app.PNG)
