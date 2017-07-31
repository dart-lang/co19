/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void abort()
 * Stop the current request.
 * The request can only be stopped if readyState is HEADERS_RECIEVED or LOADING.
 * If this method is not in the process of being sent, the method has no effect.
 * @description Checks the state of request at variuos moments of time.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var request = new HttpRequest();
  request.open('GET', "test.dart");
  request.send();
  request.abort();
  switch (request.readyState) {
    case HttpRequest.UNSENT:
      break;
    default:
      Expect.fail(
          "request.onLoad.listen: unexpected readyState:${request.readyState}");
  }
}
