/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 'In body' insertion mode: when template end tag is met, implied
 * end tags should be generated.
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  test('Generating of implied end tags. Test table elements', () {
    var doc = newHtmlDocument();

    //No end </td></tr></table> tags. Should be added implicitly
    doc.body.setInnerHtml('''
      <template id="tpl">
        <table id="tbl"><tr id="tr"><td id="td">
      </template>''',
        treeSanitizer: new NoCheck());

    var template = doc.querySelector('#tpl');

    Expect.isNotNull(template, 'Template element must be parsed');

    Expect.isNull(doc.querySelector('#tbl'),
        'Table element should not be available');
    Expect.isNull(doc.querySelector('#tr'),
        'TR element should not be available');
    Expect.isNull(doc.querySelector('#td'),
        'TD element should not be available');

    Expect.isNotNull(template.content.querySelector('#tbl'),
        'Template should contain table element');
    Expect.isNotNull(template.content.querySelector('#tr'),
        'Template should contain TR element');
    Expect.isNotNull(template.content.querySelector('#td'),
        'Template should contain TD element');
  });

  test('Generating of implied end tags. Test div element', () {
    var doc = newHtmlDocument();

    //No end </div> tag. Should be added implicitly
    doc.body.setInnerHtml(
        '<template id="tpl"><div id="dv">Div content</template>',
        treeSanitizer: new NoCheck());

    var template = doc.querySelector('#tpl');

    Expect.isNotNull(template, 'Template element must be parsed');

    Expect.isNull(doc.querySelector('#dv'),
        'DIV element should not be available');

    Expect.isNotNull(template.content.querySelector('#dv'),
        'Template should contain DIV element');
  });

  test('Generating of implied end tags. Test some text and DIV element', () {
    var doc = newHtmlDocument();

    //No end </div> tag. Should be added implicitly after text content
    doc.body.setInnerHtml(
        '<template id="tpl">Template text<div id="dv">Div content</template>',
        treeSanitizer: new NoCheck());

    var template = doc.querySelector('#tpl');

    Expect.isNotNull(template, 'Template element must be parsed');

    Expect.isNull(doc.querySelector('#dv'),
        'DIV element should not be available');

    var div = template.content.querySelector('#dv');

    Expect.isNotNull(div, 'Template should contain DIV element');

    Expect.equals('Div content', div.text,
        'Wrong template content inner text');
  });

  test('Generating of implied end tags. Test wrong end tag', () {
    var doc = newHtmlDocument();

    // Wrong end tag. Correct end tag must be added implicitly, wrong one ignored
    doc.body.setInnerHtml(
        '<template id="tpl"><div id="dv">Div content</span></template>',
        treeSanitizer: new NoCheck());

    var template = doc.querySelector('#tpl');

    Expect.isNotNull(template, 'Template element must be parsed');

    Expect.equals(1, template.content.childNodes.length,
        "Wrong number of template's children");

    Expect.isNull(doc.querySelector('#dv'),
        'DIV element should not be available');

    Expect.isNotNull(template.content.querySelector('#dv'),
        'Template should contain DIV element');

    Expect.equals('Div content', template.content.querySelector('#dv').text,
        'Wrong template content inner text');
  });
}
