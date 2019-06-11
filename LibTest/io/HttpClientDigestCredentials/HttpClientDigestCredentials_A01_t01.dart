/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Represents credentials for digest authentication. Digest
 * authentication is only supported for servers using the MD5 algorithm and
 * quality of protection (qop) of either "none" or "auth".
 * @description Checks that this class represents credentials for digest
 * authentication
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import 'dart:async';
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test() async {
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    if (request.headers[HttpHeaders.authorizationHeader] == null) {
      request.response.statusCode = HttpStatus.unauthorized;
      StringBuffer authHeader = new StringBuffer();
      authHeader.write('Digest');
      authHeader.write(', realm="realm"');
      authHeader.write(', nonce="123"');
      authHeader.write(', domain="/xxxt/"');
      request.response.headers.set(HttpHeaders.wwwAuthenticateHeader, authHeader);
      request.response.close();
    } else {
      var authorization = request.headers[HttpHeaders.authorizationHeader][0];
      Expect.isTrue(authorization.contains('Digest'));
      Expect.isTrue(authorization.contains('username="co19-test"'));
      Expect.isTrue(authorization.contains('realm="realm"'));
      Expect.isTrue(authorization.contains('algorithm="MD5"'));
      Expect.isTrue(authorization.contains('uri="/xxx"'));
      request.response.close();
      server.close();
      asyncEnd();
    }
  });
  HttpClient client = new HttpClient();

  client.authenticate = (Uri url, String scheme, String realm) {
    Expect.equals("Digest", scheme);
    Expect.equals("realm", realm);
    Completer completer = new Completer();
    client.addCredentials(
        Uri.parse("http://${localhost}:${server.port}/xxx"), "realm",
          new HttpClientDigestCredentials("co19-test", "password"));
    completer.complete(true);

    return completer.future;
  };

  client
      .getUrl(Uri.parse("http://${localhost}:${server.port}/xxx"))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {});
  });
}

main() {
  asyncStart();
  test();
}
