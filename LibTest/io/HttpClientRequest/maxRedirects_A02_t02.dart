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
 * @description Checks that if number of redirects exceeds this property value
 * then a RedirectException occurs
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var localhost = InternetAddress.LOOPBACK_IP_V4.address;

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
    request.response.redirect(new Uri(path: redirectUri), status: status);
    if (uri >= maxRedirects) {
      server.close();
    }
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "0")
      .then((HttpClientRequest request) {
        if (maxRedirects > 0) {
          request.maxRedirects = maxRedirects;
        }
        return request.close();
  }).catchError((e) {
    Expect.isTrue(e is RedirectException);
    asyncEnd();
  });
}

main() {
  test("get", -1, HttpStatus.MOVED_TEMPORARILY);
  test("get", -1, HttpStatus.FOUND);
  test("get", -1, HttpStatus.MOVED_PERMANENTLY);
  test("get", -1, HttpStatus.SEE_OTHER);
  test("get", -1, HttpStatus.TEMPORARY_REDIRECT);

  test("head", -1, HttpStatus.MOVED_TEMPORARILY);
  test("head", -1, HttpStatus.FOUND);
  test("head", -1, HttpStatus.MOVED_PERMANENTLY);
  test("head", -1, HttpStatus.SEE_OTHER);
  test("head", -1, HttpStatus.TEMPORARY_REDIRECT);

  test("get", 3, HttpStatus.MOVED_TEMPORARILY);
  test("get", 3, HttpStatus.FOUND);
  test("get", 3, HttpStatus.MOVED_PERMANENTLY);
  test("get", 3, HttpStatus.SEE_OTHER);
  test("get", 3, HttpStatus.TEMPORARY_REDIRECT);

  test("head", 3, HttpStatus.MOVED_TEMPORARILY);
  test("head", 3, HttpStatus.FOUND);
  test("head", 3, HttpStatus.MOVED_PERMANENTLY);
  test("head", 3, HttpStatus.SEE_OTHER);
  test("head", 3, HttpStatus.TEMPORARY_REDIRECT);

  test("get", 6, HttpStatus.MOVED_TEMPORARILY);
  test("get", 6, HttpStatus.FOUND);
  test("get", 6, HttpStatus.MOVED_PERMANENTLY);
  test("get", 6, HttpStatus.SEE_OTHER);
  test("get", 6, HttpStatus.TEMPORARY_REDIRECT);

  test("head", 6, HttpStatus.MOVED_TEMPORARILY);
  test("head", 6, HttpStatus.FOUND);
  test("head", 6, HttpStatus.MOVED_PERMANENTLY);
  test("head", 6, HttpStatus.SEE_OTHER);
  test("head", 6, HttpStatus.TEMPORARY_REDIRECT);
}
