// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String getAllResponseHeaders()
/// Retrieve all the response headers from a request.
/// null if no headers have been received. For multipart requests,
/// getAllResponseHeaders will return the response headers for the current part
/// of the request.
/// @description Checks that response headers are retrieved.

import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

void check(String allHeaders) {
  List<String> headers = allHeaders.split('\n');
  for (String header in headers) {
    List<String> entry = header.split(':');
    if (entry[0] == "content-type") {
      Expect.isTrue(entry[1].trim().startsWith("text/plain"));
      return;
    }
  }
  Expect.fail("content-type not found");
}

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
        check(request.getAllResponseHeaders());
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
