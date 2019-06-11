/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void findProxy=(
 *  String f(
 *  Uri url
 *  )
 *  )
 * Sets the function used to resolve the proxy server to be used for opening a
 * HTTP connection to the specified url. If this function is not set, direct
 * connections will always be used.
 *
 * The string returned by f must be in the format used by browser PAC (proxy
 * auto-config) scripts. That is either
 *
 * "DIRECT"
 * for using a direct connection or
 *
 * "PROXY host:port"
 * for using the proxy server host on port port.
 *
 * A configuration can contain several configuration elements separated by
 * semicolons, e.g.
 *
 * "PROXY host:port; PROXY host2:port2; DIRECT"
 * The static function findProxyFromEnvironment on this class can be used to
 * implement proxy server resolving based on environment variables.
 * @description Checks that this setter sets the function used to resolve the
 * proxy server to be used for opening a HTTP connection to the specified url.
 * Test "PROXY" connection and Basic authentication
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import 'dart:async';
import "dart:convert";
import "../../../Utils/expect.dart";

test() async {
  bool authenticateProxyCalled = false;
  bool findProxyCalled = false;
  int requestCounter = 0;

  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen((HttpRequest request) {
    if (request.headers[HttpHeaders.proxyAuthorizationHeader] == null) {
      request.response.statusCode = HttpStatus.unauthorized;
      request.response.headers
          .set(HttpHeaders.proxyAuthenticateHeader, 'Basic, realm=realm');
      request.response.statusCode = HttpStatus.proxyAuthenticationRequired;
      request.response.close();
    } else {
      var authorization = request.headers[HttpHeaders.proxyAuthorizationHeader][0];
      String encoded = base64.encode(utf8.encode("co19-test:password"));
      Expect.equals("Basic ${encoded}", authorization);
      Expect.isTrue(authenticateProxyCalled);
      Expect.isTrue(findProxyCalled);
      request.response.close();
      server.close();
      asyncEnd();
    }
  });

  HttpClient client = new HttpClient();
  client.findProxy = (Uri uri) {
    findProxyCalled = true;
    return "PROXY ${InternetAddress.loopbackIPv4.address}:${server.port}";
  };

  client.authenticateProxy =
      (String host, int port, String scheme, String realm) {
        authenticateProxyCalled = true;
        Expect.equals(InternetAddress.loopbackIPv4.address, host);
        Expect.equals(server.port, port);
        Expect.equals("Basic", scheme);
        Expect.equals("realm", realm);
        Completer completer = new Completer();
        client.addProxyCredentials(InternetAddress.loopbackIPv4.address, port,
            "realm", new HttpClientBasicCredentials("co19-test", "password"));
        completer.complete(true);
        return completer.future;
  };

  client
      .getUrl(Uri.parse(
          "http://${InternetAddress.loopbackIPv4.address}:${server.port}"))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {});
  });
}

main() {
  asyncStart();
  test();
}
