/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If parser in 'in head' insertion mode meets template end tag
 * and if the stack of open elements has no template element in html scope,
 * then this is a parse error; ignore the token.
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  test('</template> tag in HTML head without start one should be ignored', () {
    var doc = newHtmlDocument();

    doc.head.setInnerHtml(
        '</template>',
        treeSanitizer: new NoCheck());

    Expect.equals(0, doc.head.childNodes.length,
        'Element must be ignored');
  });

  test('Test valid <template> element and </template> tag after it', () {
    var doc = newHtmlDocument();

    doc.head.setInnerHtml(
        '<template id="tmpl"></template></template>',
        treeSanitizer: new NoCheck());

    Expect.equals(1, doc.head.childNodes.length,
        'Element must be ignored');

    Expect.isNotNull(doc.querySelector('#tmpl'),
        'Element should present it document head');
  });

  test('Test valid <template> element and </template> tag before it', () {
    var doc = newHtmlDocument();

    doc.head.setInnerHtml(
        '</template><template id="tmpl"></template>',
        treeSanitizer: new NoCheck());

    Expect.equals(1, doc.head.childNodes.length,
        'Element must be ignored');

    Expect.isNotNull(doc.querySelector('#tmpl'),
        'Element should present it document head');
  });

  test('Test valid <template> element, <title> element and </template> tag before them', () {
    var doc = newHtmlDocument();

    doc.head.setInnerHtml(
        '</template><template id="tmpl"></template><title></title>',
        treeSanitizer: new NoCheck());

    Expect.equals(2, doc.head.childNodes.length,
        'Element must be ignored');

    Expect.isNotNull(doc.querySelector('#tmpl'),
        'Valid element should present it document head');

    Expect.isNotNull(doc.querySelector('title'),
        'Valid title element should present it document head');
  });

  test('Test valid <template> element, <title> element and </template> tag after them', () {
    var doc = newHtmlDocument();

    doc.head.setInnerHtml(
      '<template id="tmpl"></template><title></title></template>',
        treeSanitizer: new NoCheck());

    Expect.equals(2, doc.head.childNodes.length,
        'Element must be ignored');

    Expect.isNotNull(doc.querySelector('#tmpl'),
        'Valid element should present it document head');

    Expect.isNotNull(doc.querySelector('title'),
        'Valid title element should present it document head');
  });
}