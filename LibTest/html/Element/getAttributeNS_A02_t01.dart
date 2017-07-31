/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String getAttributeNS(String namespaceURI, String localName)
 * Retrieve the value of the attribute with the specified name and namespace,
 * from the current node.
 * from MDN: Return value
 * The string value of the specified attribute. If the attribute doesn't exist, the result is null.
 * @description Checks that if the attribute doesn't exist, the result is null.
 * @needsreview issue #16395
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = new Element.html('<a xlink:href="1" xlink:custom="2">a</a>',
      treeSanitizer: new NullTreeSanitizer());

  document.body.append(x);

  Expect.isNull(x.getAttributeNS(XlinkNamespace, 'unexistent'));
}
