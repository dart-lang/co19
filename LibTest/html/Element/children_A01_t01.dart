// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion List<Element> children
/// List of the direct children of this element.
/// @description Checks expected children

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x0 = new Element.html('<table></table>');
  Expect.equals(0, x0.children.length);

  var x = document.body;
  if (x != null) {
    x.innerHtml = '<div></div>text node<p></p><!--commment node-->';

    Expect.equals(2, x.children.length);
    Expect.isTrue(x.childNodes[0] is DivElement);
    Expect.isTrue(x.childNodes[2] is ParagraphElement);
  } else {
    Expect.fail("Body is null");
  }
}
