/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool followRedirects
 *  read / write
 * Set this property to true if this request should automatically follow
 * redirects. The default is true.
 *
 * Automatic redirect will only happen for "GET" and "HEAD" requests and only
 * for the status codes HttpHeaders.MOVED_PERMANENTLY (301), HttpStatus.found
 * (302), HttpStatus.movedTemporarily (302, alias for HttpStatus.found),
 * HttpStatus.seeOther (303) and HttpStatus.temporaryRedirect (307). For
 * HttpStatus.seeOther (303) automatic redirect will also happen for "POST"
 * requests with the method changed to "GET" when following the redirect.
 *
 * All headers added to the request will be added to the redirection request(s).
 * However, any body send with the request will not be part of the redirection
 * request(s).
 * @description Checks that redirect doesn't happen for DELETE, PUT, POST and
 * PATCH requests
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method, int statusCode) async {
  asyncStart();
  HttpServer server = await HttpServer.bind(localhost, 0);
  int counter = 0;
  Uri redirectUri = Uri.parse("http://${localhost}:${server.port}/yyy");
  server.listen((HttpRequest request) {
    if (counter == 0) {
      new Future.delayed(new Duration(seconds: 1), () {
        server.close();
        asyncEnd();
      });
    }
    if (request.uri.path == "/xxx") {
        if (counter++ > 0) {
          Expect.fail("Excessive request");
        }
        request.response.redirect(redirectUri, status: statusCode);
    } else {
      Expect.fail("Wrong URI:" + request.uri.path);
    }
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "/xxx")
      .then((HttpClientRequest request) {
        return request.close();
  }).then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {});
  });
}

main() {
  test("DELETE", HttpStatus.movedPermanently);
  test("DELETE", HttpStatus.found);
  test("DELETE", HttpStatus.movedTemporarily);
  test("DELETE", HttpStatus.seeOther);
  test("DELETE", HttpStatus.temporaryRedirect);

  test("PUT", HttpStatus.movedPermanently);
  test("PUT", HttpStatus.found);
  test("PUT", HttpStatus.movedTemporarily);
  test("PUT", HttpStatus.seeOther);
  test("PUT", HttpStatus.temporaryRedirect);

  test("POST", HttpStatus.movedPermanently);
  test("POST", HttpStatus.found);
  test("POST", HttpStatus.movedTemporarily);
  test("POST", HttpStatus.temporaryRedirect);

  test("PATCH", HttpStatus.movedPermanently);
  test("PATCH", HttpStatus.found);
  test("PATCH", HttpStatus.movedTemporarily);
  test("PATCH", HttpStatus.seeOther);
  test("PATCH", HttpStatus.temporaryRedirect);
}
