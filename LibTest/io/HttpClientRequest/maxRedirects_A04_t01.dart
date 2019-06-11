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
 * @description Checks that this property doesn't work for DELETE, PUT, POST and
 * PATH methods
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "dart:async";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method, int maxRedirects) async {
  asyncStart();
  int counter = 0;
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    if (counter == 0) {
      new Future.delayed(new Duration(seconds: 1), () {
        server.close();
      });
    }
    Expect.equals(0, counter);
    maxRedirects = (maxRedirects == -1 ? 5 : maxRedirects);
    int uri = int.parse(request.uri.path.substring(1));
    Expect.equals(counter, uri);
    counter++;
    String redirectUri = "/${uri + 1}";
    request.response.redirect(new Uri(path: redirectUri));
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
  test("DELETE", -1);
  test("PUT", -1);
  test("POST", -1);
  test("PATCH", -1);

  test("DELETE", 3);
  test("PUT", 3);
  test("POST", 3);
  test("PATCH", 3);

  test("DELETE", 6);
  test("PUT", 6);
  test("POST", 6);
  test("PATCH", 6);
}
