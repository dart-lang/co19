/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void open(String method, String url, {bool async, String user, String password})
 * Specify the desired url, and method to use in making the request.
 * By default the request is done asyncronously, with no user or password authentication information. If async is false, the request will be send synchronously.
 * Calling open again on a currently active request is equivalent to calling abort.
 * @description Checks the state of opened request.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var request = new HttpRequest();
  request.open('GET', "test.dart");
  Expect.equals(HttpRequest.OPENED, request.readyState, "after open");
}
