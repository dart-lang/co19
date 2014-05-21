/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that createElementNS("", ...) creates an element in null
 * namespace. Per DOM 3 Core,
 * In programming languages where empty strings can be differentiated from
 * null, empty strings, when given as a namespace URI, are converted to null.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var elem = document.createElementNS("", "p");
  shouldBe(elem.namespaceUri, null);
}
