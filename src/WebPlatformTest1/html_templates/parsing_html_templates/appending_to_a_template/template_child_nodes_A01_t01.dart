/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HTML parser must append template's child nodes only to the
 * template contents node.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {

  test('Test base case', () {
    var doc = newHtmlDocument();
    
    doc.body.setInnerHtml(
      '<template id="tmpl1">'
      '<div id="div1">This is div inside template</div>'
      '<div id="div2">This is another div inside template</div>'
      '</template>',
      treeSanitizer: new NoCheck());
    
    var template = doc.querySelector('#tmpl1');
      
    Expect.equals(0, template.childNodes.length,
        'Wrong number of template child nodes');

    Expect.equals(2, template.content.childNodes.length,
        'Wrong number of template content child nodes');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Element is absent in the template content');

    Expect.isNotNull(template.content.querySelector('#div2'),
        'Element is absent in the template content');
  });

  test('Test nested template', () {
    var doc = newHtmlDocument();
    
    doc.body.setInnerHtml(
      '<template id="tmpl1">'
      '<div id="div1">This is div inside template</div>'
      '<div id="div2">This is another div inside template</div>'
      '<template id="tmpl2">'
      '<div id="div3">This is div inside nested template</div>'
      '<div id="div4">This is another div inside nested template</div>'
      '</template>'
      '</template>',
      treeSanitizer: new NoCheck());

    var template = doc.querySelector('#tmpl1');

    Expect.equals(0, template.childNodes.length,
        'Wrong number of template child nodes');

    Expect.equals(3, template.content.childNodes.length,
        'Wrong number of template content child nodes');

    Expect.isNotNull(template.content.querySelector('#div1'),
        'Element is absent in the template content');

    Expect.isNotNull(template.content.querySelector('#div2'),
        'Element is absent in the template content');

    var nestedTemplate = template.content.querySelector('#tmpl2');

    Expect.equals(0, nestedTemplate.childNodes.length,
        'Wrong number of template child nodes');

    Expect.equals(2, nestedTemplate.content.childNodes.length,
        'Wrong number of nested template content child nodes');

    Expect.isNotNull(nestedTemplate.content.querySelector('#div3'),
        'Element is absent in the template content');

    Expect.isNotNull(nestedTemplate.content.querySelector('#div4'),
        'Element is absent in the template content');
  });
}