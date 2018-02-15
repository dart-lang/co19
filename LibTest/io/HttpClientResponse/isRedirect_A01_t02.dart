/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isRedirect
 * Returns whether the status code is one of the normal redirect codes
 * HttpStatus.MOVED_PERMANENTLY, HttpStatus.FOUND, HttpStatus.MOVED_TEMPORARILY,
 * HttpStatus.SEE_OTHER and HttpStatus.TEMPORARY_REDIRECT.
 * @description Checks that this getter returns whether the status code is one
 * of the normal redirect codes
 * @author sgrekhov@unipro.ru
 * @issue 31962
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var localhost = InternetAddress.LOOPBACK_IP_V4.address;

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
    response.transform(UTF8.decoder).listen((content) {

    });
  });
}

main() {
  test("get", HttpStatus.MOVED_PERMANENTLY);
  test("get", HttpStatus.FOUND);
  test("get", HttpStatus.MOVED_TEMPORARILY);
  test("get", HttpStatus.SEE_OTHER);
  test("get", HttpStatus.TEMPORARY_REDIRECT);

  test("head", HttpStatus.MOVED_PERMANENTLY);
  test("head", HttpStatus.FOUND);
  test("head", HttpStatus.MOVED_TEMPORARILY);
  test("head", HttpStatus.SEE_OTHER);
  test("head", HttpStatus.TEMPORARY_REDIRECT);
}
