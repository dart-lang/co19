/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> getString(String url, {bool withCredentials, void onProgress(ProgressEvent e)})
 * Creates a GET request for the specified url.
 * The server response must be a text/ mime type for this request to succeed.
 * This is similar to request but specialized for HTTP GET requests which return text content.
 * @description Checks that readystatechange events are exposed.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  asyncStart();
  var f = HttpRequest.getString("test.dart", onProgress: (event) {
//      UtilsHtml.show("event.type=${event.type}");
    Expect.equals("progress", event.type, "stream.listen.onData");
  });
  f.then((content) {
    asyncEnd();
  }, onError: (Object error) {
    Expect.fail("request.onLoad.listen:onError($error)");
  });
}
