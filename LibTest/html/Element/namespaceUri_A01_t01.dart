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
  var x = new DivElement();
  Expect.equals(HtmlNamespace, x.namespaceUri);

  Element y = new Element.html('<svg><circle></circle></svg>',
      treeSanitizer: new NullTreeSanitizer());

  Expect.equals(SvgNamespace, y.namespaceUri);
  Expect.equals(SvgNamespace, (y.firstChild as Element).namespaceUri);
}
