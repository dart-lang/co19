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
 * @assertion Upper-boundary encapsulation:
 * The ownerDocument property of all nodes in shadow tree refers to the
 * document of the shadow host.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

testElement(elementName) {
  var doc = document.implementation.createHtmlDocument('Test');
  var element = doc.createElement(elementName);
  doc.body.append(element);
  var shadowRoot = element.createShadowRoot();
  HTML5_ELEMENT_NAMES.forEach((name) {
    shadowRoot.append(doc.createElement(name));
  });

  var iterator = new NodeIterator(shadowRoot, 0xFFFFFFFF);
  var node;
  while (node = iterator.nextNode()) {
    assert_equals(node.ownerDocument, doc);
  }
}

main() {
  var testParameters = HTML5_ELEMENT_NAMES.map((name) {
    return [
    'ownerDocument property of any elements in a shadow tree should ' +
    'match the document of the shadow host, when the host is a "' +
    name + '" element.',
      name
    ];
  });

  generate_tests(testElement, testParameters);
}
