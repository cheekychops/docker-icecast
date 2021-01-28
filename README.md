# Icecast-KH in Docker

## Run

Run with default password, export port 8000

```bash
docker run -p 8000:8000 cheekychops/icecast-kh
$BROWSER localhost:8000
```

Run with custom password

```bash
docker run -p 8000:8000 -e ICECAST_SOURCE_PASSWORD=aaaa -e ICECAST_ADMIN_PASSWORD=bbbb -e ICECAST_PASSWORD=cccc -e ICECAST_RELAY_PASSWORD=dddd cheekychops/icecast-kh
```

Run with custom configuration

```bash
docker run -p 8000:8000 -v /local/path/to/icecast.xml:/etc/icecast.xml cheekychops/icecast-kh
```

Extends Dockerfile

```Dockerfile
FROM cheekychops/icecast-kh
ADD ./icecast.xml /etc/icecast.xml
```

Docker-compose

```yaml
icecast:
  image: cheekychops/docker-icecast
  volumes:
  - logs:/var/log/icecast2
  - /etc/localtime:/etc/localtime:ro
  environment:
  - ICECAST_SOURCE_PASSWORD
  - ICECAST_ADMIN_PASSWORD
  - ICECAST_PASSWORD
  - ICECAST_RELAY_PASSWORD
  - ICECAST_ADMIN
  - ICECAST_HOSTNAME
  - ICECAST_LOCATION
  - ICECAST_MAX_SOURCES
  - ICECAST_MAX_LISTENERS
  - ICECAST_X_FORWARDED_FOR
  - ICECAST_LOG_LEVEL
  env_file: .env
```

## License

[MIT](https://github.com/cheekychops/docker-icecast-kh/blob/master/LICENSE.md)
