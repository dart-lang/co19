/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String get namespaceUri
 * A URI that identifies the XML namespace of this element.
 * null if no namespace URI is specified.
 * @description Checks expected namespaceUri values
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = new IFrameElement();
  Expect.equals(HtmlNamespace, x.namespaceUri);
}
