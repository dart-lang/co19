/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Represents credentials for basic authentication.
 * @description Checks that class represents credentials for basic
 * authentication.
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
      request.response.headers.set(HttpHeaders.wwwAuthenticateHeader, 'Basic');
      request.response.close();
    } else {
      var authorization = request.headers[HttpHeaders.authorizationHeader][0];
      String encoded = base64.encode(utf8.encode("co19-test:password"));
      Expect.equals("Basic ${encoded}", authorization);
      request.response.close();
      server.close();
      asyncEnd();
    }
  });
  HttpClient client = new HttpClient();

  client.authenticate = (Uri url, String scheme, String realm) {
    Expect.equals("Basic", scheme);
    Expect.isNull(realm);
    Completer completer = new Completer();
    client.addCredentials(Uri.parse("http://${localhost}:${server.port}"), "",
          new HttpClientBasicCredentials("co19-test", "password"));
    completer.complete(true);

    return completer.future;
  };

  client
      .getUrl(Uri.parse(
          "http://${InternetAddress.loopbackIPv4.address}:${server.port}/xxx"))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {});
  });
}

main() {
  asyncStart();
  test();
}
