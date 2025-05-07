FROM dart:stable

# Создаем рабочую директорию
WORKDIR /app

# Копируем pubspec и зависимости
COPY pubspec.* ./
RUN dart pub get

# Копируем остальной код
COPY . .

# Указываем точку входа
CMD ["dart", "bin/jwt_verification.dart"]
