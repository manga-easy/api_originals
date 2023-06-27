# Use latest stable channel SDK.
FROM dart:3.0.5-sdk

# Resolve app dependencies.
WORKDIR /app
COPY files files
COPY bin/server server
RUN chmod +x server
CMD ["./server"]

# $ docker build -t api-manga-easy .
# $ docker run -it --rm -p 80:80 --name api-easy api-manga-easy
