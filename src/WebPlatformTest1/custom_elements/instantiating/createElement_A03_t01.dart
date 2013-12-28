/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an element definition with matching localName, namespace,
 * and TYPE is not registered with token's document, set TYPE to localName
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  var elements = HTML5_ELEMENTS.toSet().difference(HTML5_DOCUMENT_ELEMENTS.toSet());
  elements.remove('time');
  
  // Foo* classes and getFooClass are defined in testcommon.dart

  for (var element in elements) {
    var name = 'x-foo-$element';
    // creating before register
    var x = document.createElement(element, name);
    Expect.notEquals(getFooClass(name), x.runtimeType);

    // creating after register
    document.register(name, getFooClass(name), extendsTag: element);
    x = document.createElement(element, name); 
    Expect.equals(getFooClass(name), x.runtimeType);
  }
}
