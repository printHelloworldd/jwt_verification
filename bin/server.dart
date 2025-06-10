/*
This file is part of jwt_verification,
an open-source application for secure communication.

For license and copyright information please see:
https://github.com/printHelloworldd/jwt_verification/blob/main/LEGAL.md
*/

import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import 'package:jwt_verification/main.dart' as verification;

void main(List<String> arguments) async {
  final app = Router();
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  app.post("/verify-jwt", (Request request) async {
    return await verification.verify(request);
  });

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(app.call);

  final server = await io.serve(handler, "0.0.0.0", port);
  print("Server listening on port ${server.port}");
}
