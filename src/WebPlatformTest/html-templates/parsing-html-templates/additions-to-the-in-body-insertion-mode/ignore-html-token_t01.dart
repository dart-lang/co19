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
 * @assertion If parser is in 'in body' insertion mode and meets HTML token
 * it should be ignored
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<html><body></body></html>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 0,
      'Template cannot contain HTML element');

  }, 'Ignore HTML token. Test HTML element assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<div id="div1">Some text</div><html><body></body></html>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 1,
      'Template cannot contain HTML element');
    assert_not_equals(template.content.querySelector('#div1'), null,
      'Template should contain valid element');

  }, 'Ignore HTML token.'
  + 'Test HTML element and some valid element before it, assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<html><body></body></html><div id="div1">Some text</div>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 1,
      'Template cannot contain HTML element');
    assert_not_equals(template.content.querySelector('#div1'), null,
      'Template should contain valid element');

  }, 'Ignore HTML token. '
  + 'Test HEAD element and some valid element after it, assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<template id="t2"><html><body></body></html></template>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 1,
      'Template should contain nested template');
    assert_not_equals(template.content.querySelector('#t2'), null,
      'Template should contain nested element');

    var nestedTemplate = template.content.querySelector('#t2');

    assert_equals(nestedTemplate.content.childNodes.length, 0,
      'Template cannot contain HTML element');

  }, 'Ignore HTML token. '
  + 'Test HTML tag inside template tag assigned to another template\'s innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<html><div id="div1">Some text</div></html>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 1,
      'Template cannot contain HTML element');
    assert_not_equals(template.content.querySelector('#div1'), null,
      'Template should contain a valid element');

  }, 'Ignore HTML token. Test some valid element inside HTML element');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<html><body><div id="div1">Some text</div><body></html>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 1,
      'Template cannot contain HTML element');
    assert_not_equals(template.content.querySelector('#div1'), null,
      'Template should contain valid element');

  }, 'Ignore HTML token. Test valid element inside HTML and BODY elements');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<html><span id="span1">Span</span><body><div id="div1">Some text</div><body></html>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 2,
      'Template cannot contain HTML element');
    assert_not_equals(template.content.querySelector('#div1'), null,
      'Template should contain valid DIV element');

    assert_not_equals(template.content.querySelector('#span1'), null,
      'Template should contain valid SPAN element');

  }, 'Ignore HTML token. Test valid element inside and between HTML and BODY elements');
}
