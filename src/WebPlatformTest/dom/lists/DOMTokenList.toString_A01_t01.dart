/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/*
 * after web-platform-tests/dom/lists/DOMTokenList-stringifier.html
 *
 * @assertion http://dom.spec.whatwg.org/#dom-domtokenlist-stringifier
 * TODO rename and move to more appropriate directory
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  var span = new Element.html('<span class="   a  a b"></span>');
  Expect.equals(span.getAttribute("class"), "   a  a b",
                "getAttribute should return the literal value");
  Expect.equals(span.className, "   a  a b",
                "className should return the literal value");
  Expect.equals(span.classes.toString(), "a b",
                "classes.toString() should compress whitespace");
  Expect.equals(span.classes.toString(), "a b",
                "classes.toString() should compress whitespace");
//  print("cl=${span.classes.runtimeType}");
  Expect.isTrue(span.classes is CssClassSet);
}
