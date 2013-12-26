/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The custom element type can be given to a custom element at the
 * time of its instantation as the value of the is attribute of the custom
 * element.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  var elements = HTML5_ELEMENTS.toSet().difference(HTML5_DOCUMENT_ELEMENTS.toSet());
  elements.remove('time');
  
  // Foo* classes and getFooClass are defined in testcommon.dart

  for (var element in elements) {
    var name = 'x-foo-$element';
    document.register(name, getFooClass(name), extendsTag: element);
    if (HTML5_TABLE_ELEMENTS.contains(element)) {
      document.body.setInnerHtml('<table><$element id="qwe" is="$name"></$element></table>',
          treeSanitizer: new NoCheck());
    } else {
      document.body.setInnerHtml('<$element id="qwe" is="$name"></$element>',
          treeSanitizer: new NoCheck());
    }
    
    var x = document.query('#qwe');
    Expect.equals(getFooClass(name), x.runtimeType);
  }
}
