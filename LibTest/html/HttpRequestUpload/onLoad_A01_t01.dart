/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Stream<ProgressEvent> onLoad
 * Stream of load events handled by this HttpRequestEventTarget.
 * @description Checks the state of request at various moments of time.
 */
import "dart:html";
import "../../../Utils/expect.dart";

int get crossOriginPort {
  var searchUrl = window.location.search!;
  print("SearchURL=" + searchUrl);
  var crossOriginStr = 'crossOriginPort=';
  var index = searchUrl.indexOf(crossOriginStr);
  var nextArg = searchUrl.indexOf('&', index);
  return int.parse(searchUrl.substring(index + crossOriginStr.length,
      nextArg == -1 ? searchUrl.length : nextArg));
}

var port = crossOriginPort;
var host = '${window.location.protocol}//${window.location.hostname}:$port';

main() {
  HttpRequest request = new HttpRequest();
  var url = '$host/root_dart/tests/co19/src/LibTest/html/xhr_cross_origin_data.txt';
  request.open('GET', url);
  Expect.equals(HttpRequest.OPENED, request.readyState, "after open");
  print("Log 1");
  HttpRequestUpload upload = request.upload;
  asyncStart();
  print("Log 2");
  upload.onLoad.listen((event) {
    print("Log 5");
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
    print("Log 6");
    Expect.fail("request.onLoad.listen:onError($error)");
  });
  print("Log 3");
  request.send();
  print("Log 4");
  Expect.equals(HttpRequest.OPENED, request.readyState, "after send");
}
