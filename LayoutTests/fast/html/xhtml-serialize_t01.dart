/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks whether serialized invalid XHTML is valid XML
 * (for bug 9901)
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var doc = (new DomParser()).parseFromString('<input xmlns="http://www.w3.org/1999/xhtml">123</input>', 'text/xml');
  var str = (new XmlSerializer()).serializeToString(doc);

  Expect.equals('123', doc.firstChild.firstChild.nodeValue);
  Expect.equals('<input xmlns=\"http://www.w3.org/1999/xhtml\">123</input>', str);
}
