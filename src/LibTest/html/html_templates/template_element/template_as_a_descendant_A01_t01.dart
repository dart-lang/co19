/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Template element can be a descendant of the head, body and
 * frameset elements.
 * @needsreview NotSupportedError: The implementation did not support the requested type of object or operation. (Dartium)
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

check(doc, element) {
  test('Test when template is a child of $element', () {
    element.setInnerHtml('<template>some text</template>',
        treeSanitizer: new NoCheck());

    Expect.isNotNull(element.querySelector('template'));
  });

  test('Test when template is an indirect child of $element', () {
    element.setInnerHtml('<div><template>some text</template></div>',
        treeSanitizer: new NoCheck());

    Expect.isNotNull(element.querySelector('template'));
  });

  test('Test when template is an appended child of $element', () {
    var template = doc.createElement('template');

    element.append(template);

    Expect.isNotNull(element.querySelector('template'));
  });

  test('Test when template is an appended indirect child of $element', () {
    var template = doc.createElement('template');
    var div = doc.createElement('div');

    div.append(template);
    element.append(div);

    Expect.isNotNull(element.querySelector('template'));
  });
}

main() {
  var doc = newHtmlDocument();
  var frameset = doc.createElement('frameset');

  check(doc, doc.body);
  check(doc, doc.head);
  check(doc, frameset);
}
