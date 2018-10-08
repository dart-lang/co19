/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addCredentials(
 *  Uri url,
 *  String realm,
 *  HttpClientCredentials credentials
 *  )
 * Add credentials to be used for authorizing HTTP requests.
 * @description Checks that this method adds credentials to be used for
 * authorizing HTTP requests. Test realm argument
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen((HttpRequest request) {
    if (request.headers[HttpHeaders.authorizationHeader] == null) {
      request.response.statusCode = HttpStatus.unauthorized;
      request.response.headers.set(HttpHeaders.wwwAuthenticateHeader,
          'Digest, realm="server-realm", nonce=1');
      request.response.close();
    } else {
      var authorization = request.headers[HttpHeaders.authorizationHeader][0];
      Expect.isTrue(authorization.contains('realm="client-realm"'));
      request.response.close();
      server.close();
      asyncEnd();
    }
  });

  HttpClient client = new HttpClient();
  client.authenticate = (Uri url, String scheme, String realm) {
    Expect.equals("Digest", scheme);
    Expect.equals("server-realm", realm);
    Completer completer = new Completer();
    client.addCredentials(Uri.parse("http://${localhost}:${server.port}"),
        "client-realm",
        new HttpClientDigestCredentials("co19-test", "password"));
    completer.complete(true);
    return completer.future;
  };

  client.getUrl(Uri.parse("http://${localhost}:${server.port}"))
    .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
    });
}

main() {
  asyncStart();
  test();
}
