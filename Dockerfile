# Use latest stable channel SDK.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code (except anything in .dockerignore) and AOT compile app.
COPY . .
RUN dart compile exe bin/server.dart -o bin/server

# Start server.
EXPOSE 80
CMD ["/app/bin/server"]

# $ docker build -t api-manga-easy .
# $ docker run -it --rm -p 80:80 --name api-easy api-manga-easy
