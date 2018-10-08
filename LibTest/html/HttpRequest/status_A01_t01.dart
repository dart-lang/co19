/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int status
 * The http result code from the request (200, 404, etc).
 * @description Checks that status is 200 for successful request.
 */
import "dart:html";
import "dart:async";
import "../../../UtilsHtml/expect.dart";

main() {
  asyncStart();
  Future<HttpRequest> f = HttpRequest.request("test.dart");
  f.then((HttpRequest r) {
    Expect.equals(200, r.status);
    asyncEnd();
  });
}
