/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void authenticateProxy=(
 *  Future<bool> f(
 *  String host,
 *  int port,
 *  String scheme,
 *  String realm
 *  )
 *  )
 * Sets the function to be called when a proxy is requesting authentication.
 * Information on the proxy in use and the security realm for the authentication
 * are passed in the arguments host, port and realm.
 *
 * The function returns a Future which should complete when the authentication
 * has been resolved. If credentials cannot be provided the Future should
 * complete with false. If credentials are available the function should add
 * these using addProxyCredentials before completing the Future with the value
 * true.
 *
 * If the Future completes with true the request will be retried using the
 * updated credentials. Otherwise response processing will continue normally.
 * @description Checks that this setter sets the function to be called when a
 * site is requesting a proxy authentication. Test Basic authentication
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import 'dart:async';
import "dart:convert";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 0);
  server.listen((HttpRequest request) {
    var response = request.response;
    if (request.headers[HttpHeaders.PROXY_AUTHORIZATION] == null) {
      response.statusCode = HttpStatus.UNAUTHORIZED;
      response.headers
          .set(HttpHeaders.PROXY_AUTHENTICATE, 'Basic, realm=realm');
      response.statusCode = HttpStatus.PROXY_AUTHENTICATION_REQUIRED;
      response.close();
    } else {
      var authorization = request.headers[HttpHeaders.PROXY_AUTHORIZATION][0];
      String encoded = BASE64.encode(UTF8.encode("co19-test:password"));
      Expect.equals("Basic ${encoded}", authorization);
      response.close();
      server.close();
      asyncEnd();
    }
  });
  HttpClient client = new HttpClient();
  client.findProxy = (Uri uri) {
    return "PROXY ${InternetAddress.LOOPBACK_IP_V4.address}:${server.port}";
  };

  client.authenticateProxy =
      (String host, int port, String scheme, String realm) {
    Expect.equals(InternetAddress.LOOPBACK_IP_V4.address, host);
    Expect.equals(server.port, port);
    Expect.equals("Basic", scheme);
    Expect.equals("realm", realm);
    Completer completer = new Completer();
    client.addProxyCredentials(InternetAddress.LOOPBACK_IP_V4.address, port,
        "realm", new HttpClientBasicCredentials("co19-test", "password"));
    completer.complete(true);
    return completer.future;
  };

  client
      .getUrl(Uri.parse(
          "http://${InternetAddress.LOOPBACK_IP_V4.address}:${server.port}"))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
    response.transform(UTF8.decoder).listen((content) {});
  });
}

main() {
  asyncStart();
  test();
}
