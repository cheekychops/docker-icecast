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
  image: cheekychops/icecast-kh
  volumes:
  - logs:/var/log/icecast2
  - /etc/localtime:/etc/localtime:ro
  environment:
  - ICECAST_SOURCE_PASSWORD=aaa
  - ICECAST_ADMIN_PASSWORD=bbb
  - ICECAST_PASSWORD=ccc
  - ICECAST_RELAY_PASSWORD=ddd
  - ICECAST_LOCATION=Earth
  - ICECAST_ADMIN=john@doe.com
  - ICECAST_HOSTNAME=stream.doe.com
  - ICECAST_MAX_SOURCES=2
  - ICECAST_MAX_LISTENERS=1000
  - ICECAST_X_FORWARDED_FOR=*
  ports:
  - 8000:8000
```

## License

[MIT](https://github.com/cheekychops/docker-icecast-kh/blob/master/LICENSE.md)
