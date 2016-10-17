/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String getAttributeNS(String namespaceURI, String localName)
 * Retrieve the value of the attribute with the specified name and namespace,
 * from the current node.
 * @description Checks expected attributes values.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = new Element.html(
      '<svg><foo xlink:href="1" xlink:custom="2"></foo></svg>',
      treeSanitizer: new NullTreeSanitizer());
  document.body.append(x);
  AnchorElement y = x.firstChild;

  Expect.equals('1', y.getAttributeNS(XlinkNamespace, 'href'));
  Expect.equals('2', y.getAttributeNS(XlinkNamespace, 'custom'));
}
