/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void overrideMimeType(String override)
 * Specify a particular MIME type (such as text/xml) desired for the response.
 * This value must be set before the request has been sent.
 * @description Checks that MIME type is overriden.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

const desired = "text/plain";

main() {
  var request = new HttpRequest();
  request.open('GET', "test.dart");
  request.overrideMimeType(desired);
  asyncStart();
  request.onLoad.listen((event) {
    switch (request.readyState) {
      case HttpRequest.DONE:
        Expect.equals(desired, request.getResponseHeader("content-type"));
        asyncEnd();
        break;
      case HttpRequest.HEADERS_RECEIVED:
        break;
      case HttpRequest.LOADING:
        break;
      default:
        Expect.fail(
            "request.onLoad.listen: unexpected readyState:${request.readyState}");
    }
  }, onError: (Object error) {
    Expect.fail("request.onLoad.listen:onError($error)");
  });
  request.send();
  Expect.equals(HttpRequest.OPENED, request.readyState, "after send");
}
