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
 * authorizing HTTP proxies
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen((HttpRequest request) {
    var authorization = request.headers[HttpHeaders.proxyAuthorizationHeader][0];
    String encoded = base64.encode(utf8.encode("co19-test:password"));
    Expect.equals("Basic ${encoded}", authorization);
    request.response.close();
    server.close();
    asyncEnd();
  });

  HttpClient client = new HttpClient();
  client.findProxy = (Uri uri) {
    return "PROXY ${localhost}:${server.port}";
  };
  client.addProxyCredentials(localhost, server.port,
      "realm", new HttpClientBasicCredentials("co19-test", "password"));

  client.getUrl(Uri.parse("http://${localhost}:${server.port}"))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
  });
}

main() {
  asyncStart();
  test();
}
