/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addProxyCredentials(
 *  String host,
 *  int port,
 *  String realm,
 *  HttpClientCredentials credentials
 *  )
 * Add credentials to be used for authorizing HTTP proxies.
 * @description Checks that this method adds credentials to be used for
 * authorizing HTTP proxies. Test realm argument
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import 'dart:async';
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var localhost = InternetAddress.LOOPBACK_IP_V4.address;

test() async {
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    var response = request.response;
    if (request.headers[HttpHeaders.PROXY_AUTHORIZATION] == null) {
      response.statusCode = HttpStatus.UNAUTHORIZED;
      response.headers.set(HttpHeaders.PROXY_AUTHENTICATE,
          'Digest, realm="server-realm", nonce=123');
      response.statusCode = HttpStatus.PROXY_AUTHENTICATION_REQUIRED;
      response.close();
    } else {
      var authorization = request.headers[HttpHeaders.PROXY_AUTHORIZATION][0];
      Expect.isTrue(authorization.contains('Digest'));
      Expect.isTrue(authorization.contains('realm="client-realm"'));
      response.close();
      server.close();
      asyncEnd();
    }
  });

  HttpClient client = new HttpClient();
  client.findProxy = (Uri uri) {
    return "PROXY ${localhost}:${server.port}";
  };
  client.authenticateProxy =
      (String host, int port, String scheme, String realm) {
    Expect.equals(localhost, host);
    Expect.equals(server.port, port);
    Expect.equals("Digest", scheme);
    Expect.equals("server-realm", realm);
    Completer completer = new Completer();
    client.addProxyCredentials(InternetAddress.LOOPBACK_IP_V4.address, port,
        "client-realm",
        new HttpClientDigestCredentials("co19-test", "password"));
    completer.complete(true);
    return completer.future;
  };
  client.getUrl(Uri.parse("http://${localhost}:${server.port}"))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {});
}

main() {
  asyncStart();
  test();
}
