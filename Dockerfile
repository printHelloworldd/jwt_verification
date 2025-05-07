FROM dart:stable

# Создаем рабочую директорию
WORKDIR /app

# Копируем pubspec и зависимости
COPY pubspec.* ./
RUN dart pub get

# Копируем остальной код
COPY . .

# Собираем
RUN dart compile exe bin/jwt_verification.dart -o bin/server

# Запускаем сервер
CMD ["./bin/server"]
