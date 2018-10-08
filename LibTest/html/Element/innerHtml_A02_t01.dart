/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String innerHtml
 * Parses the HTML fragment and sets it as the contents of this element.
 *
 * This uses the default sanitization behavior to sanitize the HTML fragment,
 * use setInnerHtml to override the default behavior.
 * @description Checks that default behavior is to sanitize the html fragment.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div></div>');
  x.innerHtml = '<button foo="bar"></button>';
  dynamic y = x.firstChild;
  Expect.mapEquals({}, y.attributes);

  x.innerHtml = '<unknown></unknown><div></div>';
  Expect.isTrue(x.firstChild is DivElement);
}
