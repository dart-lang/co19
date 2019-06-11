/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int maxRedirects
 *  read / write
 * Set this property to the maximum number of redirects to follow when
 * followRedirects is true. If this number is exceeded an error event will be
 * added with a RedirectException.
 *
 * The default value is 5.
 * @description Checks that if number of redirects not exceeds this property
 * value then redirect is allowed
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method, int maxRedirects, int status) async {
  asyncStart();
  int counter = 0;
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    maxRedirects = (maxRedirects == -1 ? 5 : maxRedirects);
    int uri = int.parse(request.uri.path.substring(1));
    Expect.equals(counter, uri);
    counter++;
    String redirectUri = "/${uri + 1}";
    if (uri >= maxRedirects) {
      request.response.close();
      server.close();
    } else {
      request.response.redirect(new Uri(path: redirectUri), status: status);
    }
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "0")
      .then((HttpClientRequest request) {
        if (maxRedirects > 0) {
          request.maxRedirects = maxRedirects;
        }
        return request.close();
  }).then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {});
    asyncEnd();
  });
}

main() {
  test("get", -1, HttpStatus.movedTemporarily);
  test("get", -1, HttpStatus.found);
  test("get", -1, HttpStatus.movedPermanently);
  test("get", -1, HttpStatus.seeOther);
  test("get", -1, HttpStatus.temporaryRedirect);

  test("head", -1, HttpStatus.movedTemporarily);
  test("head", -1, HttpStatus.found);
  test("head", -1, HttpStatus.movedPermanently);
  test("head", -1, HttpStatus.seeOther);
  test("head", -1, HttpStatus.temporaryRedirect);

  test("get", 3, HttpStatus.movedTemporarily);
  test("get", 3, HttpStatus.found);
  test("get", 3, HttpStatus.movedPermanently);
  test("get", 3, HttpStatus.seeOther);
  test("get", 3, HttpStatus.temporaryRedirect);

  test("head", 3, HttpStatus.movedTemporarily);
  test("head", 3, HttpStatus.found);
  test("head", 3, HttpStatus.movedPermanently);
  test("head", 3, HttpStatus.seeOther);
  test("head", 3, HttpStatus.temporaryRedirect);

  test("get", 6, HttpStatus.movedTemporarily);
  test("get", 6, HttpStatus.found);
  test("get", 6, HttpStatus.movedPermanently);
  test("get", 6, HttpStatus.seeOther);
  test("get", 6, HttpStatus.temporaryRedirect);

  test("head", 6, HttpStatus.movedTemporarily);
  test("head", 6, HttpStatus.found);
  test("head", 6, HttpStatus.movedPermanently);
  test("head", 6, HttpStatus.seeOther);
  test("head", 6, HttpStatus.temporaryRedirect);
}
