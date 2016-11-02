/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests: setting HTMLDocument::title
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var parser = new DomParser();
  HtmlDocument doc = parser.parseFromString(
      '<!DOCTYPE html><head></head><body></body>',
      'text/html');
  doc.title = "test";

  shouldBe(doc.title, "test");
}
