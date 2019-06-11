/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void authenticate=(
 *    Future<bool> f(
 *      Uri url,
 *      String scheme,
 *      String realm
 *    )
 * )
 * Sets the function to be called when a site is requesting authentication.
 * The URL requested and the security realm from the server are passed in the
 * arguments url and realm.
 *
 * The function returns a Future which should complete when the authentication
 * has been resolved. If credentials cannot be provided the Future should
 * complete with false. If credentials are available the function should add
 * these using addCredentials before completing the Future with the value true.
 *
 * If the Future completes with true the request will be retried using the
 * updated credentials. Otherwise response processing will continue normally.
 * @description Checks that this setter sets the function to be called when a
 * site is requesting authentication. Test Basic authorisation
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import 'dart:async';
import "dart:convert";
import "../../../Utils/expect.dart";

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen((HttpRequest request) {
    if (request.headers[HttpHeaders.authorizationHeader] == null) {
      request.response.statusCode = HttpStatus.unauthorized;
      request.response.headers.set(HttpHeaders.wwwAuthenticateHeader,
          'Basic, realm="realm", domain="/xxxt/"');
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
    Expect.equals("realm", realm);
    Completer completer = new Completer();
    client.addCredentials(
        Uri.parse(
            "http://${InternetAddress.loopbackIPv4.address}:${server.port}/xxx"),
        "realm",
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
