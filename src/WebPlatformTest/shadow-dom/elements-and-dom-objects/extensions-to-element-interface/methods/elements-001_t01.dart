/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All HTML elements must be able to host shadow trees.
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  testElement(elementName) {
    var doc = document.implementation.createHtmlDocument('Test');
    var element = doc.createElement(elementName);
    doc.body.append(element);

    var shadowRoot1 = element.createShadowRoot();
    assert_equals(shadowRoot1.ownerDocument, doc);

    var shadowRoot2 = element.createShadowRoot();
    assert_equals(shadowRoot2.ownerDocument, doc);
  }

  var testParameters = HTML5_ELEMENT_NAMES.map((name) {
    return [
    'Checks whether an element "' + name + '" can create a shadow root.',
      name
    ];
  });

  generate_tests(testElement, testParameters);
}
