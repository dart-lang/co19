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
  IFrameElement x = new IFrameElement();
  x.setAttributeNS(XlinkNamespace, "href", "foo");
  x.setAttributeNS(XlinkNamespace, "custom", "bar");
  Map attrs = x.getNamespacedAttributes(XlinkNamespace);

  print("length=${attrs.length}");

  Expect.equals('foo', attrs["href"]);
  Expect.equals('bar', attrs["custom"]);
}
