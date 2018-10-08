/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static Future<HttpRequest> request(String url, {String method,
 * bool withCredentials, String responseType, String mimeType,
 * Map<String, String> requestHeaders, sendData, Function onProgress})
 * Creates and sends a URL request for the specified url.
 * By default request will perform an HTTP GET request, but a different method
 * (POST, PUT, DELETE, etc) can be used by specifying the method parameter.
 * The Future is completed when the response is available.
 * If specified, sendData will send data in the form of a ByteBuffer, Blob,
 * Document, String, or FormData along with the HttpRequest.
 * The withCredentials parameter specified that credentials such as a cookie
 * (already) set in the header or authorization headers should be specified
 * for the request. Details to keep in mind when using credentials:
 * Using credentials is only useful for cross-origin requests.
 * The Access-Control-Allow-Origin header of url cannot contain a wildcard (*).
 * The Access-Control-Allow-Credentials header of url must be set to true.
 * If Access-Control-Expose-Headers has not been set to true, only a subset
 * of all the response headers will be returned when calling getAllRequestHeaders.
 * @description Checks that the method works with "GET".
 */
import "dart:html";
import "dart:async";
import "../../../UtilsHtml/expect.dart";

main() {
  asyncStart();
  Future<HttpRequest> f =
      HttpRequest.request("test.dart", method: "GET", onProgress: (event) {
//      UtilsHtml.show("event.type=${event.type}");
    Expect.equals("progress", event.type, "stream.listen.onData");
  });
  f.then((HttpRequest r) {
    Expect.isTrue(r.responseText.length > 0);
    asyncEnd();
  }, onError: (Object error) {
    Expect.fail("request.onLoad.listen:onError($error)");
  });
}
