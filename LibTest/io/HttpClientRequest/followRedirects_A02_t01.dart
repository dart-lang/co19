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
 * @description Checks that if followRedirects is true then redirect happens for
 * GET and HEAD requests
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method, int statusCode) async {
  asyncStart();
  bool redirected = false;
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  Uri redirectUri = Uri.parse("http://${localhost}:${server.port}/yyy");
  server.listen((HttpRequest request) {
    if (request.uri.path == "/xxx") {
      request.response.redirect(redirectUri, status: statusCode);
      redirected = true;
    } else if (request.uri.path == "/yyy") {
      Expect.isTrue(redirected);
      request.response.write(helloWorld);
      request.response.close();
      server.close();
      asyncEnd();
    } else {
      server.close();
      Expect.fail("Wrong URI:" + request.uri.path);
    }
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "/xxx")
      .then((HttpClientRequest request) {
        Expect.isTrue(request.followRedirects);
        return request.close();
  }).then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {});
  });
}

main() {
  test("get", HttpStatus.movedPermanently);
  test("get", HttpStatus.found);
  test("get", HttpStatus.movedTemporarily);
  test("get", HttpStatus.seeOther);
  test("get", HttpStatus.temporaryRedirect);

  test("head", HttpStatus.movedPermanently);
  test("head", HttpStatus.found);
  test("head", HttpStatus.movedTemporarily);
  test("head", HttpStatus.seeOther);
  test("head", HttpStatus.temporaryRedirect);
}
