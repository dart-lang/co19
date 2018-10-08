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
import "../testcommon.dart";

main() {
  var x = new Element.html(
      '<div id="id1" foo="foo1">'
      '<pre id="id2" foo="foo2"></pre>text'
      '</div>',
      treeSanitizer: new NullTreeSanitizer());

  Element y = x.clone(false);
  Expect.mapEquals({'id': 'id1', 'foo': 'foo1'}, y.attributes, 'shallow copy');

  y = x.clone(true);
  Expect.mapEquals({'id': 'id1', 'foo': 'foo1'}, y.attributes, 'deep copy');

  var pre = y.querySelector('pre');
  Expect.mapEquals(
      {'id': 'id2', 'foo': 'foo2'}, pre.attributes, 'deep copy, children');
}
