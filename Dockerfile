FROM dart:stable

WORKDIR /app

COPY pubspec.* ./
RUN dart pub get

COPY . .

RUN dart compile exe bin/jwt_verification.dart -o bin/server

CMD ["./bin/server"]
