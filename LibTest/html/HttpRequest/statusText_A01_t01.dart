/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ffinal String statusText
 * The request response string (such as \"200 OK\").
 * @description Checks that status text is "200 OK" for successful request.
 */
import "dart:html";
import "dart:async";
import "../../../UtilsHtml/expect.dart";

main() {
  asyncStart();
  Future<HttpRequest> f = HttpRequest.request("test.dart");
  f.then((HttpRequest r) {
    Expect.equals("200 OK", r.statusText);
    asyncEnd();
  });
}
