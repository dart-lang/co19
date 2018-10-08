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
 * @assertion HTML Elements and Their Shadow Trees: Check that details can 
 * contain at least two insertion points with matching criteria 
 * 'summary:first-of-type' and 'universal selector'
 */

import 'dart:html';
import '../testcommon.dart';

main() {
  //test universal selector
  test(() {

    var d = document;

    // create element
    var el = d.createElement('details');
    el.setAttribute('open', 'open');
    d.body.append(el);

    el.setInnerHtml('' +
      '<span id="shadow">This is a node that should be distributed</span>' +
      '<span id="flbk">This is a fallback content</span>',
      treeSanitizer: new NullTreeSanitizer());

    var s = createSR(el);
    s.setInnerHtml('<content select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(d.querySelector('#shadow').offsetTop > 0, '\'details\' should allow at least one insertion point');
    assert_equals(d.querySelector('#flbk').offsetTop, 0, 'Fallback content shouldn\'t be rendered');

  }, 'A_09_00_04_T01');


  //test summary:first-of-type
  test(() {

    var d = document;

    // create element
    var el = d.createElement('details');
    el.setAttribute('open', 'open');
    d.body.append(el);

    el.setInnerHtml('' +
      '<summary>' +
      '<span id="shadow">This is a node that should be distributed</span>' +
      '</summary>' +
      '<span id="flbk">Unlucky content</span>',
      treeSanitizer: new NullTreeSanitizer());

    var s = createSR(el);
    s.setInnerHtml('<content select="summary:first-of-type"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(d.querySelector('#shadow').offsetTop > 0, 'details should allow insertion point' +
      'with summary:first-of-type matching criteria');
    assert_equals(d.querySelector('#flbk').offsetTop, 0, 'Fallback content shouldn\'t be rendered');

  }, 'A_09_00_04_T02');
}
