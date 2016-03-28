## docker-flume

Docker image containing [Apache Flume](https://flume.apache.org/)

## Available environment variables

* `FLUME_AGENT_NAME` - name of flume agent to run.  Defaults to `a1`.
* `FLUME_CONF_DIR` - directory for flume environment/configuration files. Defaults to `/opt/flume/conf`.
* `FLUME_CONF_FILE` - location of flume configuration file. Defaults to `$FLUME_CONF_DIR/example-a1.conf`.

## Example usage

### Using the sample Flume configuration

Build the image:

```bash
    docker build -t flume .
```

Create container:

```bash
docker run -ti --name=flume-example-a1 flume
```

In another terminal, send an event to Flume:

```bash
docker exec -i -t flume-example-a1 bash -c 'echo "Hello world" | nc -q 1 localhost 44444'
OK
```

In the terminal where you ran the Docker container you should now see the message in the Flume console:

```
2016-03-27 23:49:32,727 (SinkRunner-PollingRunner-DefaultSinkProcessor) [INFO - org.apache.flume.sink.LoggerSink.process(LoggerSink.java:94)] Event: { headers:{} body: 48 65 6C 6C 6F 20 77 6F 72 6C 64 21             Hello world! }
```

Use `CTRL+c` to stop the container and then you can delete it:

``` bash
docker rm flume-example-a1
```

### Using your own Flume configuration

Create your own `Dockerfile` using this as the base image and include the Flume configuration file:

```Dockerfile
FROM probablyfine/flume
ADD flume.conf /var/tmp/flume.conf
```

Build it:

```bash
docker build -t my-flume-image .
```

And to run:

```bash
docker run \
  -e FLUME_AGENT_NAME=someagent \
  -e FLUME_CONF_FILE=/var/tmp/flume.conf \
  my-flume-image
```
