/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests: getting HTMLDocument::title
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var parser = new DomParser();
  var doc = parser.parseFromString(
      '<!DOCTYPE html><head><title>test</title></head><body></body>',
      'text/html');

  shouldBe(doc.title, "test");
}
