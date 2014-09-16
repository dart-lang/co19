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
 * @assertion ShadowRoot Object: innerHtml of type DOMString; Test setter
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  test(() {
    var d = document;

    var host = d.createElement('div');
    d.body.append(host);
    var s = createSR(host);

    var span = d.createElement('span');
    span.innerHtml = 'Some text';
    s.append(span);

    s.innerHtml = '<input type="text"><div>new text</div>';

    assert_equals(s.innerHtml.toLowerCase(), '<input type="text"><div>new text</div>',
      'Wrong value of ShadowRoot innerHtml attribute');
  }, 'A_10_01_01_04_02_T01_01');


  test(() {
    var d = document;

    var host = d.createElement('div');
    d.body.append(host);
    var s = createSR(host);

    var span = d.createElement('span');
    span.setAttribute('id', 'spanId');
    span.innerHtml = 'Some text';
    s.append(span);

    s.innerHtml = '<input type="text" id="inputId"><div id="divId">new text</div>';

    assert_equals(s.querySelector('#spanId'), null, 'Point 1:innerHtml attribute must replace all content of ' +
      'the ShadowRoot object');

    assert_true(s.querySelector('#inputId') != null, 'Point 2:innerHtml attribute must replace all content of ' +
      'the ShadowRoot object');
    assert_equals(s.querySelector('#inputId').getAttribute('id'), 'inputId',
      'Point 3:innerHtml attribute must replace all content of the ShadowRoot object');

    assert_true(s.querySelector('#divId') != null, 'Point 3:innerHtml attribute must replace all content of ' +
        'the ShadowRoot object');
    assert_equals(s.querySelector('#divId').getAttribute('id'), 'divId',
        'Point 4:innerHtml attribute must replace all content of the ShadowRoot object');
  }, 'A_10_01_01_04_02_T01_02');
}
