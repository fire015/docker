# Build

```
cd php-base
docker build -t fire015/php-base --no-cache=true .
```

# Tag

```
docker tag -f [imageID] fire015/php-base:latest
```

# Push

```
docker push fire015/php-base
```