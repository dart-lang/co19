/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAttributeNS(String namespaceURI, String qualifiedName,
 * String value)
 * Set the value of the attribute with the specified name and namespace, from
 * the current node.
 * @description Checks expected attributes values after setting
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  Element x = new Element.html(
      '<svg><foo xlink:href="1" xlink:custom="2"></foo></svg>',
      treeSanitizer: new NullTreeSanitizer());
  Element y = x.firstChild;

  y.setAttributeNS(XlinkNamespace, 'href', 'foo');
  Expect.equals('foo', y.getAttributeNS(XlinkNamespace, 'href'),
      'change standard attribute');

  y.setAttributeNS(XlinkNamespace, 'custom', 'bar');
  Expect.equals('bar', y.getAttributeNS(XlinkNamespace, 'custom'),
      'change custom attribute');

  y.setAttributeNS(XlinkNamespace, 'new', 'one');
  Expect.equals(
      'one', y.getAttributeNS(XlinkNamespace, 'new'), 'add new attribute');
}
