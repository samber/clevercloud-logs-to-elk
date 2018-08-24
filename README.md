
# samber/clevercloud-logs-to-elk

## Build

```
docker build -t samber/clevercloud-logs-to-elk:0.10.1 .
docker push samber/clevercloud-logs-to-elk:0.10.1
```

## Run in standalone

```
docker run --rm -it \
	-e CLEVERCLOUD_TOKEN=xxxxxxxxxxxxxxx \
	-e CLEVERCLOUD_SECRET=xxxxxxxxxxxxxxx \
	-e CLEVERCLOUD_APP=app_xxxxxx-xxxxxx-xxxxxx \
	-e LOGSTASH_HOST=logstash \
	-e LOGSTASH_PORT=5000 \
	samber/clevercloud-logs-to-elk:0.10.1
```

## Run with ELK

First, set `CLEVERCLOUD_****` environment variables in `docker-compose.yml`.

```
docker-compose up -d
```

Go `http://localhost:5601`
