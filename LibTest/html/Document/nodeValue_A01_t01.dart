/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String nodeValue
 * The value of this node.
 * This varies by this type's nodeType
 * MDN: Attr:Document	value of attribute:	null
 * @description Checks the value of document.nodeValue.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  Expect.isNull(document.nodeValue);
}
