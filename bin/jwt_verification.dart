import 'package:jwt_verification/jwt_verification.dart' as jwt_verification;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

void main(List<String> arguments) async {
  final app = Router();

  app.post("/verify-jwt", (Request request) async {
    return await jwt_verification.verify(request);
  });

  await io.serve(app.call, "localhost", 8084);
}
