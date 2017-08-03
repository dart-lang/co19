/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String innerHtml
 * Parses the HTML fragment and sets it as the contents of this element.
 * @description Checks expected innerHtml settings
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div></div>');
  x.innerHtml = '<button>foo</button>';
  Expect.isTrue(x.firstChild is ButtonElement);
}
