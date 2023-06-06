// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void writeAll(
///  Iterable objects, [
///  String separator = ""
///  ])
/// Iterates over the given objects and writes them in sequence.
///
/// If separator is provided, a write with the separator is performed between any
/// two elements of objects`.
///
/// This operation is non-blocking. See flush or done for how to get any errors
/// generated by this call.
/// @description Checks that any errors generated by this call can be caught
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

class MarkerException {
  const MarkerException();
}

class C {
  String toString() {
    if (1 + 1 == 2) {
      throw const MarkerException();
    }
    return "This is C";
  }
}

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  asyncStart();
  Iterable objects = [1, "2", 3.25, new C(), null];
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.response.write('OK');
    request.response.close();
  });

  HttpClient client = new HttpClient();
  HttpClientRequest request =
      await client.open(method, localhost, server.port, "");
  request.contentLength = 6;
  Expect.throws(() {
    request.writeAll(objects);
  }, (e) => identical(e, const MarkerException()));
  await request.close();
  client.close(force: true);
  server.close();
  asyncEnd();
}

main() {
  test("get");
  test("head");
  test("delete");
  test("put");
  test("post");
  test("patch");
}
