/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Element.html(String html, {NodeValidator validator,
 *  NodeTreeSanitizer treeSanitizer})
 * The HTML fragment is parsed as if it occurred within the context of a <body>
 * tag, this means that special elements such as <caption> which must be 
 * parsed within the scope of a <table> element will be dropped. 
 * @description Checks that special elements are dropped.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<head>foo</head><table></table>');
  Expect.isTrue(x is TableElement);

  var y = new Element.html('<table></table><caption>foo</caption>');
  Expect.isTrue(y is TableElement);
}
