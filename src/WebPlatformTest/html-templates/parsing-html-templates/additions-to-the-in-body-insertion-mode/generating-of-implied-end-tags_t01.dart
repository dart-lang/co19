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
 * @assertion 'In body' insertion mode: when template end tag is met, implied 
 * end tags should be generated
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();

    //No end </td></tr></table> tags. Should be added implicitly
    doc.body.innerHtml = '<template id="tpl">'
    + '<table id="tbl"><tr id="tr"><td id="td"></template>';

  var template = doc.querySelector('#tpl');

  assert_not_equals(template, null, 'Template element must be parsed');

  assert_equals(doc.querySelector('#tbl'), null, 'Table element should not be available');
  assert_equals(doc.querySelector('#tr'), null, 'TR element should not be available');
  assert_equals(doc.querySelector('#td'), null, 'TD element should not be available');

  assert_not_equals(template.content.querySelector('#tbl'), null,
    'Template should contain table element');
  assert_not_equals(template.content.querySelector('#tr'), null,
    'Template should contain TR element');
  assert_not_equals(template.content.querySelector('#td'), null,
    'Template should contain TD element');

  }, 'Generating of implied end tags. Test table elements');



  test(() {
    var doc = newHTMLDocument();

    //No end </div> tag. Should be added implicitly
    doc.body.innerHtml = '<template id="tpl"><div id="dv">Div content</template>';

    var template = doc.querySelector('#tpl');

    assert_not_equals(template, null, 'Template element must be parsed');

    assert_equals(doc.querySelector('#dv'), null, 'DIV element should not be available');

    assert_not_equals(template.content.querySelector('#dv'), null,
      'Template should contain DIV element');

  }, 'Generating of implied end tags. Test div element');


  test(() {
    var doc = newHTMLDocument();

    //No end </div> tag. Should be added implicitly after text content
    doc.body.innerHtml = '<template id="tpl">Template text<div id="dv">Div content</template>';

    var template = doc.querySelector('#tpl');

    assert_not_equals(template, null, 'Template element must be parsed');

    assert_equals(doc.querySelector('#dv'), null, 'DIV element should not be available');

    var div = template.content.querySelector('#dv');

    assert_not_equals( div, null, 'Template should contain DIV element');
    assert_equals(div.text, 'Div content', 'Wrong template content inner text');

  }, 'Generating of implied end tags. Test some text and DIV element');


  test(() {
    var doc = newHTMLDocument();

    // Wrong end tag. Correct end tag must be added implicitly, wrong one ignored
    doc.body.innerHtml = '<template id="tpl"><div id="dv">Div content</span></template>';

    var template = doc.querySelector('#tpl');

    assert_not_equals(template, null, 'Template element must be parsed');

    assert_equals(template.content.childNodes.length, 1,
      'Wrong number of template\'s children');

    assert_equals(doc.querySelector('#dv'), null, 'DIV element should not be available');

    assert_not_equals(template.content.querySelector('#dv'), null,
      'Template should contain DIV element');
    assert_equals(template.content.querySelector('#dv').text,
      'Div content', 'Wrong template content inner text');

  }, 'Generating of implied end tags. Test wrong end tag');
}
