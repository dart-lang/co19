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
 * @assertion If parser is in 'in body' insertion mode and meets HEAD token
 * it should be ignored
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<head></head>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 0,
      'Template cannot contain HEAD element');

  }, 'Ignore HEAD token. Test empty HEAD element assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.setInnerHtml('<head><title>test</title></head>',
      treeSanitizer: new NullTreeSanitizer());

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 1,
      'Wrong number of template content children');
    assert_equals(template.content.firstChild.nodeName, 'TITLE',
      'Template should contain children of ignored HEAD element');

  }, 'Ignore HEAD token. Test not empty HEAD element assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.setInnerHtml('<div id="div1">Some text</div><head><title>test</title></head>',
      treeSanitizer: new NullTreeSanitizer());

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 2,
      'Wrong number of template content children');
    assert_not_equals(template.content.querySelector('#div1'), null,
      'Template should contain valid element');
    assert_equals(template.content.lastChild.tagName, 'TITLE',
      'Template should contain children of ignored HEAD element');

  }, 'Ignore HEAD token. '
  + 'Test HEAD element and some valid element before it, assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.setInnerHtml('<head><title>test</title></head><div id="div1">Some text</div>',
      treeSanitizer: new NullTreeSanitizer());

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 2,
      'Wrong number of template content children');
    assert_equals(template.content.firstChild.tagName, 'TITLE',
      'Template should contain children of ignored HEAD element');
    assert_not_equals(template.content.querySelector('#div1'), null,
      'Template should contain valid element');

  }, 'Ignore HEAD token. '
  + 'Test HEAD element and some valid element after it, assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.setInnerHtml('<template id="t2"><head><title>test</title></head></template>',
      treeSanitizer: new NullTreeSanitizer());

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 1,
      'Template should contain nested template');
    assert_not_equals(template.content.querySelector('#t2'), null,
      'Template should contain nested element');

    var nestedTemplate = template.content.querySelector('#t2');

    assert_equals(nestedTemplate.content.childNodes.length, 1,
      'Wrong number of template content children');
    assert_equals(nestedTemplate.content.firstChild.tagName, 'TITLE',
      'Template should contain children of ignored HEAD element');

  }, 'Ignore HEAD token. '
  + 'Test HEAD tag inside template tag assigned to another template\'s innerHtml');
}
