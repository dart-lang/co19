/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node clone(bool deep)
 * Returns a copy of this node.
 * MDN: Cloning a node copies all of its attributes and their values,
 * including intrinsic (in–line) listeners. 
 * @description Checks that attributes are copied
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  Map<String, String> attrs = {'id': 'id1', 'foo': 'foo1'};
  x.attributes = attrs;

  IFrameElement y = x.clone(false);
  Expect.mapEquals(attrs, y.attributes, 'shallow copy');

  y = x.clone(true);
  Expect.mapEquals(attrs, y.attributes, 'deep copy');
}
