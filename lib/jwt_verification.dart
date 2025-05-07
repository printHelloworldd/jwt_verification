import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:http/http.dart' as http;

Future<Response> verify(Request request) async {
  final payload = await request.readAsString();
  final data = json.decode(payload);

  final receivedIdToken = data["idToken"];
  final receivedUserId = data["senderUserId"];

  final String webApiKey = "AIzaSyBUZKGq6lfijJTGnz7Ok8CM-v5Pr0WTCyk";

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
