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
 * @assertion If parser is in 'in body' insertion mode and meets FRAMESET token
 * it should be ignored
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<frameset cols="25%,*,25%">'
    + '<frame src="frame_a.htm">'
    + '<frame src="frame_b.htm">' + '<frame src="frame_c.htm">'
    + '</frameset>';

  doc.body.append(template);

  assert_equals(template.content.childNodes.length, 0,
    'Template cannot contain FRAMESET element');

  }, 'Ignore frameset token. Test FRAMESET element assigned to template innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<div id="div1">Some text</div>'
    + '<frameset cols="25%,*,25%">'
    + '<frame src="frame_a.htm">'
    + '<frame src="frame_b.htm">'
    + '<frame src="frame_c.htm">'
    + '</frameset>';

  doc.body.append(template);

  assert_equals(template.content.childNodes.length, 1,
    'Template cannot contain FRAMESET element');
  assert_not_equals(template.content.querySelector('#div1'), null,
    'Template should contain valid element');

  }, 'Ignore frameset token. '
  + 'Test FRAMESET element and some valid element before it, assigned '
  + 'to the template\'s innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<frameset cols="25%,*,25%">'
    + '<frame src="frame_a.htm">'
    + '<frame src="frame_b.htm">'
    + '<frame src="frame_c.htm">'
    + '</frameset><div id="div1">Some text</div>';

  doc.body.append(template);

  assert_equals(template.content.childNodes.length, 1,
    'Template cannot contain FRAMESET element');
  assert_not_equals(template.content.querySelector('#div1'), null,
    'Template should contain valid element');

  }, 'Ignore frameset token. '
  + 'Test FRAMESET element and some valid element after it, assigned '
  + 'to the template\'s innerHtml');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    template.innerHtml = '<template id="t2">'
    + '<frameset cols="25%,*,25%">'
    + '<frame src="frame_a.htm">'
    + '<frame src="frame_b.htm">'
    + '<frame src="frame_c.htm">'
    + '</frameset></template>';

  doc.body.append(template);

  assert_equals(template.content.childNodes.length, 1,
    'Template should contain nested template');
  assert_not_equals(template.content.querySelector('#t2'), null,
    'Template should contain nested element');

  var nestedTemplate = template.content.querySelector('#t2');

  assert_equals(nestedTemplate.content.childNodes.length, 0,
    'Template cannot contain FRAMESET element');

  }, 'Ignore frameset token. '
  + 'Test FRAMESET tag inside template tag assigned to another template\'s innerHtml');
}
