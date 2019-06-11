/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<RedirectInfo> redirects
 * Returns the series of redirects this connection has been through. The list
 * will be empty if no redirects were followed. redirects will be updated both
 * in the case of an automatic and a manual redirect.
 * @description Checks that this method returns the series of redirects this
 * connection has been through. Test server redirect
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
    request.maxRedirects = maxRedirects;
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.equals(maxRedirects, response.redirects.length);
    var count = 1;
    for (var redirectInfo in response.redirects) {
      Expect.equals(status, redirectInfo.statusCode);
      Expect.equals("/${count++}", redirectInfo.location.path);
      Expect.equals(method.toUpperCase(), redirectInfo.method);
    }
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {});
    asyncEnd();
  });
}

main() {
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
