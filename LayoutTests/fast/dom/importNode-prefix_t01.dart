/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that an element which is cloned by using importNode
 * keeps its prefix.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var elem = document.createElementNS('http://www.example.org', 'test:p');
  var importedNode = document.importNode(elem, true);

  //shouldBe(importedNode.prefix, 'test'); // no such in dart
  shouldBe(importedNode.localName, 'p');
}
