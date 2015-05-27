/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks the constants on the HttpRequst
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  shouldBe(HttpRequest.UNSENT, 0);
  shouldBe(HttpRequest.OPENED, 1);
  shouldBe(HttpRequest.HEADERS_RECEIVED, 2);
  shouldBe(HttpRequest.LOADING, 3);
  shouldBe(HttpRequest.DONE, 4);
}
