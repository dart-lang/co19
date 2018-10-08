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
 * authorizing HTTP proxies. Test wrong url argument
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen((HttpRequest request) {
    Expect.isNull(request.headers[HttpHeaders.proxyAuthorizationHeader]);
    request.response.close();
    server.close();
    asyncEnd();
  });

  HttpClient client = new HttpClient();
  client.findProxy = (Uri uri) {
    return "PROXY ${localhost}:${server.port}";
  };
  client.addProxyCredentials("http://dartlang.org", server.port, "realm",
      new HttpClientBasicCredentials("co19-test", "password"));

  client.getUrl(Uri.parse("http://${localhost}:${server.port}"))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
  });
}

main() {
  asyncStart();
  test();
}
