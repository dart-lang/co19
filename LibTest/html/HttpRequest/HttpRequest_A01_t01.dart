/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory HttpRequest()
 * General constructor for any type of request (GET, POST, etc).
 * @description Checks the state of newly created request.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var request = new HttpRequest();
  Expect.equals(HttpRequest.UNSENT, request.readyState, "after creation");
}
