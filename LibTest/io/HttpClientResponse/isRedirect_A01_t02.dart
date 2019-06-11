/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isRedirect
 * Returns whether the status code is one of the normal redirect codes
 * HttpStatus.movedPermanently, HttpStatus.found, HttpStatus.movedTemporarily,
 * HttpStatus.seeOther and HttpStatus.temporaryRedirect.
 * @description Checks that this getter returns whether the status code is one
 * of the normal redirect codes
 * @author sgrekhov@unipro.ru
 * @issue 31962
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
    Expect.isTrue(response.isRedirect);
    asyncEnd();
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {

    });
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
