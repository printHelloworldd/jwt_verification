import 'dart:io';

import 'package:jwt_verification/jwt_verification.dart' as jwt_verification;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

void main(List<String> arguments) async {
  final app = Router();
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  app.post("/verify-jwt", (Request request) async {
    return await jwt_verification.verify(request);
  });

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(app.call);

  final server = await io.serve(handler, "0.0.0.0", port);
  print("Server listening on port ${server.port}");
}
