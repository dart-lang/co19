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
 * @assertion If the stack of open elements has a template element in html
 * scope then ignore <body> the token. (fragment or template contents case)
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();

    doc.body.innerHtml = '<template id="tmpl"><body></template>';

    var template = doc.querySelector('#tmpl');

    assert_equals(template.content.childNodes.length, 0, 'Element must be ignored');

  }, 'In body insertion mode: Template contains a start tag whose tag name is body.'
  + 'Test <body> tag only');



  test(() {
    var doc = newHTMLDocument();

    doc.body.innerHtml = '<template id="tmpl"><body>Body text content</body></template>';

    var template = doc.querySelector('#tmpl');

    assert_equals(template.content.querySelector('body'), null,
      '<body> element must be ignored');
    assert_equals(template.content.childNodes.length, 1, 'Text shouldn\'t be ignored');
    assert_equals(template.content.firstChild.nodeType, Node.TEXT_NODE,
      'Text shouldn\'t be ignored');

  }, 'In body insertion mode: Template contains a start tag whose tag name is body. '
  + 'Test <body> tag containing some text');



  test(() {
    var doc = newHTMLDocument();

    doc.body.innerHtml = '<template id="tmpl"><body>'
    + '<div id="div1">DIV 1</div>'
    + '<div id="div2">DIV 2</div>'
    + '</body></template>';

  var template = doc.querySelector('#tmpl');

  assert_equals(template.content.querySelector('body'), null,
    '<body> element must be ignored');
  assert_equals(template.content.childNodes.length, 2,
    'Only body tag should be ignored');
  assert_not_equals(template.content.querySelector('#div1'), null,
    'Children of <body tag shouldn\'t be ignored');
  assert_not_equals(template.content.querySelector('#div2'), null,
    'Children of <body tag shouldn\'t be ignored');

  }, 'In body insertion mode: Template contains a start tag whose tag name is body. '
  + 'Test <body> tag containing some other elements');



  test(() {
    var doc = newHTMLDocument();

    doc.body.innerHtml = '<template id="tmpl1"><template id="tmpl2"><body>'
    + '<div id="div1">DIV 1</div>'
    + '<div id="div2">DIV 2</div>'
    + '</body></template></template>';

  var template = doc.querySelector('#tmpl1').content.querySelector('#tmpl2');

  assert_equals(template.content.querySelector('body'), null,
    '<body> element must be ignored');
  assert_equals(template.content.childNodes.length, 2,
    'Only body tag should be ignored');
  assert_not_equals(template.content.querySelector('#div1'), null,
    'Children of <body tag shouldn\'t be ignored');
  assert_not_equals(template.content.querySelector('#div2'), null,
    'Children of <body tag shouldn\'t be ignored');

  }, 'In body insertion mode: Template contains a start tag whose tag name is body. '
  + 'Test nested template tag containing <body> tag with some other elements');
}
