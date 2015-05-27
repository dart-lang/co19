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
 * @assertion Content attribute of template element is read-only
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    Expect.throws(() => template.content = null);

  }, 'Content attribute of template element is read-only. ' +
  'Test empty template');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');
    var el1 = doc.createElement('div');
    var el2 = doc.createElement('span');
    el1.append(el2);

    template.content.append(el1);

    Expect.throws(() => template.content = null);

  }, 'Content attribute of template element is read-only. ' +
  'Test not empty template populated by append()');


  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template>Text<div>DIV</div></template>';

    var template = doc.querySelector('template');

    Expect.throws(() => template.content = null);

  }, 'Content attribute of template element is read-only. ' +
  'Test not empty template populated by innerHtml');


  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template id="template1" content="Some text as a content"></template>';

    var template = doc.querySelector('#template1');

    Expect.throws(() => template.content = null);

  }, 'Content attribute of template element is read-only. ' +
  'Test that custom content attribute named \'content\' doesn\'t ' +
  'make content IDL attribute writable');


  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template id="template1" content="<div id=div1>Div content</div>"></template>';

    var template = doc.querySelector('#template1');

    Expect.throws(() => template.content = null);

    assert_equals(template.content.childNodes.length, 0,
      'Content attribute of template element should be read-only');

  }, 'Content attribute of template element is read-only. ' +
  'Test that custom content attribute named \'content\' doesn\'t ' +
  'affect content IDL attribute');
}
