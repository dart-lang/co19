/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, String> getNamespacedAttributes(String namespace)
 * Gets a map for manipulating the attributes of a particular namespace.
 * @description Checks expected attributes values.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = document.body;
  x.setInnerHtml('<svg><foo xlink:href="foo" xlink:custom="bar"></foo></svg>',
      treeSanitizer: new NullTreeSanitizer());
  var y = x.querySelector('foo');

  Expect.mapEquals({'href': 'foo', 'custom': 'bar'},
      y.getNamespacedAttributes(XlinkNamespace));
}
