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
 * for the status codes HttpHeaders.MOVED_PERMANENTLY (301), HttpStatus.FOUND
 * (302), HttpStatus.MOVED_TEMPORARILY (302, alias for HttpStatus.FOUND),
 * HttpStatus.SEE_OTHER (303) and HttpStatus.TEMPORARY_REDIRECT (307). For
 * HttpStatus.SEE_OTHER (303) automatic redirect will also happen for "POST"
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
import "dart:convert";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var localhost = InternetAddress.LOOPBACK_IP_V4.address;

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
    response.transform(UTF8.decoder).listen((content) {});
  });
}

main() {
  test("DELETE", HttpStatus.MOVED_PERMANENTLY);
  test("DELETE", HttpStatus.FOUND);
  test("DELETE", HttpStatus.MOVED_TEMPORARILY);
  test("DELETE", HttpStatus.SEE_OTHER);
  test("DELETE", HttpStatus.TEMPORARY_REDIRECT);

  test("PUT", HttpStatus.MOVED_PERMANENTLY);
  test("PUT", HttpStatus.FOUND);
  test("PUT", HttpStatus.MOVED_TEMPORARILY);
  test("PUT", HttpStatus.SEE_OTHER);
  test("PUT", HttpStatus.TEMPORARY_REDIRECT);

  test("POST", HttpStatus.MOVED_PERMANENTLY);
  test("POST", HttpStatus.FOUND);
  test("POST", HttpStatus.MOVED_TEMPORARILY);
  test("POST", HttpStatus.TEMPORARY_REDIRECT);

  test("PATCH", HttpStatus.MOVED_PERMANENTLY);
  test("PATCH", HttpStatus.FOUND);
  test("PATCH", HttpStatus.MOVED_TEMPORARILY);
  test("PATCH", HttpStatus.SEE_OTHER);
  test("PATCH", HttpStatus.TEMPORARY_REDIRECT);
}
