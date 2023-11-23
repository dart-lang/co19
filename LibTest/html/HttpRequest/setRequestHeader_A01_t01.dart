// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void setRequestHeader(String header, String value)
/// Sets the value of an HTTP request header.
/// This method should be called after the request is opened, but before the
/// request is sent.
/// Multiple calls with the same header will combine all their values into a
/// single header.
/// @description Checks that desired response header is retrieved.

import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var request = new HttpRequest();
  var port = crossOriginPort;
  var host = '${window.location.protocol}//${window.location.hostname}:$port';
  var url = '$host/root_dart/tests/co19/src/LibTest/html/xhr_cross_origin_data.txt';
  request.open('GET', url);
  asyncStart();
  request.onLoad.listen((event) {
    switch (request.readyState) {
      case HttpRequest.DONE:
        Expect.isTrue(
            request.getResponseHeader("content-type")?.startsWith("text/plain"));
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
