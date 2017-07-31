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
  IFrameElement x = new IFrameElement();
  x.setAttributeNS(XlinkNamespace, 'href', '1');
  x.setAttributeNS(XlinkNamespace, 'custom', '2');

  Expect.equals('1', x.getAttributeNS(XlinkNamespace, 'href'));
  Expect.equals('2', x.getAttributeNS(XlinkNamespace, 'custom'));
}
