/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test getting the port attribute of the URL in HTMLAnchorElement.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  AnchorElement a = document.createElement('a');

  debug("Default port is empty");
  shouldBe(a.port, '');

  debug("Unspecified port should return empty string");
  a.href = "http://example.com/";
  shouldBe(a.port, '');

  debug("Empty port should be empty");
  a.href = "http://example.com:/";
  shouldBe(a.port, '');
}

