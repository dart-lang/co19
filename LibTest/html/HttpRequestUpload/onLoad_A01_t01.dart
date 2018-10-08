/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Stream<ProgressEvent> onLoad
 * Stream of load events handled by this HttpRequestEventTarget.
 * @description Checks the state of request at variuos moments of time.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  HttpRequest request = new HttpRequest();
  request.open('GET', "test.dart");
  Expect.equals(HttpRequest.OPENED, request.readyState, "after open");
  HttpRequestUpload upload = request.upload;
  asyncStart();
  upload.onLoad.listen((event) {
    switch (request.readyState) {
      case HttpRequest.DONE:
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
