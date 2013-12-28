/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the stack of open elements has a template element in html
 * scope then ignore the <body> token. (fragment or template contents case).
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  test('Test <body> tag only', () {
    var doc = newHtmlDocument();

    doc.body.innerHtml = '<template id="tmpl"><body></template>';

    var template = doc.querySelector('#tmpl');

    Expect.equals(0, template.content.childNodes.length,
        'Element must be ignored');
  });

  test('Test <body> tag containing some text', () {
    var doc = newHtmlDocument();

    doc.body.innerHtml =
      '<template id="tmpl"><body>Body text content</body></template>';

    var template = doc.querySelector('#tmpl');

    Expect.isNull(template.content.querySelector('body'),
        '<body> element must be ignored');

    Expect.equals(1, template.content.childNodes.length,
        "Text shouldn't be ignored");

    Expect.isTrue(template.content.firstChild is Text,
        "Text shouldn't be ignored");
  });
    
  test('Test <body> tag containing some other elements', () {
    var doc = newHtmlDocument();

    doc.body.innerHtml =
      '<template id="tmpl"><body>'
      '<div id="div1">DIV 1</div>'
      '<div id="div2">DIV 2</div>'
      '</body></template>';

    var template = doc.querySelector('#tmpl');

    Expect.isNull(template.content.querySelector('body'),
        '<body> element must be ignored');

    Expect.equals(2, template.content.childNodes.length,
        'Only body tag should be ignored');
    
    Expect.isNotNull(template.content.querySelector('#div1'),
        "Children of <body tag shouldn't be ignored");
    
    Expect.isNotNull(template.content.querySelector('#div2'),
        "Children of <body tag shouldn't be ignored");
  });

  test('Test nested template tag containing <body> tag with some other elements', () {
    var doc = newHtmlDocument();

    doc.body.innerHtml =
      '<template id="tmpl1"><template id="tmpl2"><body>'
      '<div id="div1">DIV 1</div>'
      '<div id="div2">DIV 2</div>'
      '</body></template></template>';

    var template = doc.querySelector('#tmpl1').content.querySelector('#tmpl2');

    Expect.isNull(template.content.querySelector('body'),
        '<body> element must be ignored');

    Expect.equals(2, template.content.childNodes.length,
        'Only body tag should be ignored');

    Expect.isNotNull(template.content.querySelector('#div1'),
        "Children of <body tag shouldn't be ignored");

    Expect.isNotNull(template.content.querySelector('#div2'),
        "Children of <body tag shouldn't be ignored");
    
  });
}