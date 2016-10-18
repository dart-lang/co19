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
 * @assertion HTML Templates: In body insertion mode: parser should ignore BODY
 * token
 */

import '../../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<body></body>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 0,
      'Template cannot contain BODY element');

  }, 'Ignore BODY token. Test empty BODY element assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<body><div>Some content</div></body>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 1,
      'Wrong number of template content children');
    assert_equals(template.content.firstChild.nodeName, 'DIV',
      'Template should contain children of ignored BODY element');

  }, 'Ignore BODY token. Test not empty BODY element assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<body><div <div id="div1">Some content</div></body><div id="div2">Some valid content</div>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 2,
      'Wrong number of template content children');
    assert_not_equals(template.content.querySelector('#div1'), null,
      'Template should contain children of the ignored BODY element');
    assert_not_equals(template.content.querySelector('#div2'), null,
      'Template should contain valid element');

  }, 'Ignore BODY token. '
  + 'Test BODY element and some valid element after BODY tag assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<div id="div1">Some valid content</div><body><div id="div2">Some content</div></body>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 2,
      'Template cannot contain BODY element');
    assert_not_equals(template.content.querySelector('#div1'), null,
      'Template should contain valid element');
    assert_not_equals(template.content.querySelector('#div2'), null,
      'Template should contain children of the ignored BODY element');

  }, 'Ignore BODY token. '
  + 'Test BODY element and some valid element before BODY tag assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<template id="t2"><body><span>Body!<span></body></template>';

    doc.body.append(template);

    assert_equals(template.content.childNodes.length, 1,
      'Template should contain nested template');
    assert_not_equals(template.content.querySelector('#t2'), null,
      'Template should contain nested element');

    var nestedTemplate = template.content.querySelector('#t2');

    assert_equals(nestedTemplate.content.childNodes.length, 1,
      'Template cannot contain BODY element');
    assert_equals(nestedTemplate.content.firstChild.nodeName, 'SPAN',
      'Template cannot contain BODY element');

  }, 'Ignore BODY token. '
  + 'Test template with not empty BODY element inside assigned to another '
    + 'template\'s innerHtml');
}
