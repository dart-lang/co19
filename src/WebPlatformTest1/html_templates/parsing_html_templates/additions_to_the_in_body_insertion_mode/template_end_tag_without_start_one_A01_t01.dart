/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If parser in 'in body' insertion mode meets template end tag and
 * if the stack of open elements has no template element in html scope, then
 * this is a parse error; ignore the token.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  test('</template> tag in HTML body without start one should be ignored', () {
    var doc = newHtmlDocument();

    doc.body.innerHtml = '</template>';

    Expect.equals(0, doc.body.childNodes.length,'Element must be ignored');
  });

  test('Test valid <template> element and </template> tag after it', () {
    var doc = newHtmlDocument();

    doc.body.innerHtml = '<template id="tmpl"></template></template>';

    Expect.equals(1, doc.body.childNodes.length,'Element must be ignored');

    Expect.isNotNull(doc.querySelector('#tmpl'),
        'Element should present it document body');
  });

  test('Test valid <template> element and </template> tag before it', () {
    var doc = newHtmlDocument();

    doc.body.innerHtml = '</template><template id="tmpl"></template>';

    Expect.equals(1, doc.body.childNodes.length,'Element must be ignored');

    Expect.isNotNull(doc.querySelector('#tmpl'),
        'Element should present it document body');
  });

  test('Test valid <template> element, <title> element and </template> tag before them', () {
    var doc = newHtmlDocument();

    doc.body.setInnerHtml(
        '</template><template id="tmpl"></template><title></title>',
        treeSanitizer: new NoCheck());

    Expect.equals(2, doc.body.childNodes.length,
        'Element must be ignored');

    Expect.isNotNull(doc.querySelector('#tmpl'),
        'Valid element should present it document body');

    Expect.isNotNull(doc.querySelector('title'),
        'Valid title element should present it document body');
  });

  test('Test valid <template> element, <title> element and </template> tag after them', () {
    var doc = newHtmlDocument();

    doc.body.setInnerHtml(
        '<template id="tmpl"></template><title></title></template>',
        treeSanitizer: new NoCheck());

    Expect.equals(2, doc.body.childNodes.length,
        'Element must be ignored');

    Expect.isNotNull(doc.querySelector('#tmpl'),
        'Valid element should present it document body');

    Expect.isNotNull(doc.querySelector('title'),
        'Valid title element should present it document body');
  });
}