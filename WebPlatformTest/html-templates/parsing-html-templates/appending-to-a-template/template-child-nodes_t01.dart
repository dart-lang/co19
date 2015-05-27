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
 * @assertion HTML parser must append template's child nodes only to the
 * template contents node.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template id="tmpl1">' +
    '<div id="div1">This is div inside template</div>' +
    '<div id="div2">This is another div inside template</div>' +
    '</template>';

  var template = doc.querySelector('#tmpl1');

  assert_equals(template.childNodes.length, 0, 'Wrong number of template child nodes');
  assert_equals(template.content.childNodes.length, 2,
    'Wrong number of template content child nodes');

  assert_not_equals(template.content.querySelector('#div1'), null,
    'Element is absent in the template content');
  assert_not_equals(template.content.querySelector('#div2'), null,
    'Element is absent in the template content');

  }, 'Template child nodes must be appended to template content node');



  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template id="tmpl1">' +
    '<div id="div1">This is div inside template</div>' +
    '<div id="div2">This is another div inside template</div>' +
    '<template id="tmpl2">' +
    '<div id="div3">This is div inside nested template</div>' +
    '<div id="div4">This is another div inside nested template</div>' +
    '</template>' +
    '</template>';

  var template = doc.querySelector('#tmpl1');

  assert_equals(template.childNodes.length, 0,
    'Wrong number of template child nodes');
  assert_equals(template.content.childNodes.length, 3,
    'Wrong number of template content child nodes');

  assert_not_equals(template.content.querySelector('#div1'), null,
    'Element is absent in the template content');
  assert_not_equals(template.content.querySelector('#div2'), null,
    'Element is absent in the template content');

  var nestedTemplate = template.content.querySelector('#tmpl2');

  assert_equals(nestedTemplate.childNodes.length, 0,
      'Wrong number of template child nodes');
  assert_equals(nestedTemplate.content.childNodes.length, 2,
      'Wrong number of nested template content child nodes');

  assert_not_equals(nestedTemplate.content.querySelector('#div3'), null,
      'Element is absent in the template content');
  assert_not_equals(nestedTemplate.content.querySelector('#div4'), null,
      'Element is absent in the template content');

  }, 'Template child nodes must be appended to template content. Test nested template');
}



