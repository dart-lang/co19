/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node clone(bool deep)
 * Returns a copy of this node.
 * If deep is true, then all of this node's children and decendents are copied as well.
 * If deep is false, then only this node is copied.
 * @description Checks that document is shallow cloned if deep==false.
 * @needsreview issue #16409
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Document cd = document.clone(false);
  Expect.isNotNull(cd, "document.clone(false)==null");
  var childs = document.childNodes;
  var cdchilds = cd.childNodes;
  Expect.equals(childs.length, cdchilds.length);
  for (int k = 0; k < childs.length; k++) {
    Expect.identical(childs[k], cdchilds[k]);
  }
}
