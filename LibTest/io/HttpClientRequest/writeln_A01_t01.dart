// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void writeln([Object obj = ""])
/// Converts obj to a String by invoking Object.toString and writes the result to
/// this, followed by a newline.
///
/// This operation is non-blocking. See flush or done for how to get any errors
/// generated by this call.
/// @description Checks that this method adds the result to the target consumer
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  asyncStart();
  String lily = "Lily was here";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.toList().then((List<List<int>> l) {
      Expect.equals(lily + "\n", new String.fromCharCodes(l[0]));
      request.response.close();
      server.close();
      asyncEnd();
    });
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
    request.contentLength = lily.length + 1;
    request.writeln(lily);
    return request.close();
  });
}

main() {
  test("get");
  test("head");
  test("delete");
  test("put");
  test("post");
  test("patch");
}
