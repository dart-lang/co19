/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String nodeValue
 * The value of this node.
 * This varies by this type's nodeType:
 * Element -- null
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.isNull(new DivElement().nodeValue, 'ctor');

  Expect.isNull(new Element.html('<div></div>').nodeValue, 'parsed');
}
