/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Namespace chaining
 */
import "dart:html";
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
        <div id="d" xmlns:svg="http://www.w3.org/2000/svg" style="height: 110px">
            TEST FAILED
        </div>
''';

const String htmlEL3 = r'''
<svg:svg width='110' height='110'>
  <svg:defs id='defs'>
    <svg:text>TEST FAILED</svg:text>
  </svg:defs>
  <svg:rect x='5' y='5' width='100' height='100' fill='green' id='r'/>
</svg:svg>
''';

class MyNodeValidator implements NodeValidator {
    bool allowsAttribute(Element element, String attributeName, String value) {
      return true;
    }
    bool allowsElement(Element element) {
      return true;
    }
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var div = document.getElementById("d");
//    div.setInnerHtml(htmlEL3, treeSanitizer:new NullTreeSanitizer());
    div.setInnerHtml(htmlEL3, validator:new MyNodeValidator());
    var rect = document.getElementById("r");
    Expect.equals("http://www.w3.org/2000/svg", rect.namespaceUri);
}
