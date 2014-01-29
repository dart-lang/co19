/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node parentNode
 * The parent node of this node.
 * @description Checks that parentNode is changed after append to another
 * DocumentFragment
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var f = document.createDocumentFragment();
  var x = new Element.html('<span></span>');
  f.append(x);

  Expect.equals(f, x.parentNode);
}
