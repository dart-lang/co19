/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * @assertion After a custom element is instantiated, changing the value of
 * the is attribute must not affect this element's custom element type.
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

class Foo extends HtmlElement {
  Foo.created() : super.created();
}

main() {
  var elements = HTML5_ELEMENTS.toSet().difference(HTML5_DOCUMENT_ELEMENTS.toSet());
  elements.remove('time');
  
  for (var element in elements) {
    var name = 'x-foo-$element';
    document.registerElement(name, Foo);
    if (HTML5_TABLE_ELEMENTS.contains(element)) {
      document.body.setInnerHtml('<table><$element id="qwe" is="$name"></$element></table>',
          treeSanitizer: new NoCheck());
    } else {
      document.body.setInnerHtml('<$element id="qwe" is="$name"></$element>',
          treeSanitizer: new NoCheck());
    }
    
    var x = document.querySelector('#qwe');
    var elementType = new Element.tag(element).runtimeType;

    for (var element2 in elements) {
      var name2 = 'x-foo-$element-$element2';
      document.registerElement(name2, Foo);
      x.setAttribute('is', name2);
      var y = document.querySelector('#qwe');
      Expect.equals(elementType, y.runtimeType);
    }
  }
}
