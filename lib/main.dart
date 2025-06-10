/*
This file is part of jwt_verification,
an open-source application for secure communication.

For license and copyright information please see:
https://github.com/printHelloworldd/jwt_verification/blob/main/LEGAL.md
*/

import 'dart:convert';

import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/shelf.dart';

Future<Response> verify(Request request) async {
  final DotEnv env = DotEnv(includePlatformEnvironment: true)..load();

  final payload = await request.readAsString();
  final data = json.decode(payload);

  final receivedIdToken = data["idToken"];
  final receivedUserId = data["senderUserId"];

  final String? webApiKey = env["WEB_API_KEY"];

  if (webApiKey == null) {}

  final response = await http.post(
    Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=$webApiKey",
    ),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"idToken": receivedIdToken}),
  );

  if (response.statusCode == 200) {
    final userData = jsonDecode(response.body);
    final uid = userData['users'][0]['localId'];

    if (uid == receivedUserId) {
      return Response.ok(uid, headers: {"Content-Type": "application/json"});
    } else {
      return Response.forbidden(
        "Forbidden",
        headers: {"Content-Type": "application/json"},
      );
    }
  } else {
    return Response.unauthorized(
      'Invalid ID token',
      headers: {"Content-Type": "application/json"},
    );
  }
}
