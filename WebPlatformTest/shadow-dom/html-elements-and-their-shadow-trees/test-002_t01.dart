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
 * @assertion HTML Elements and Their Shadow Trees: Elements that have no 
 * fallback content should allow the shadow tree to contain no insertion 
 * points or an insertion point that matches nothing
 */

import 'dart:html';
import '../testcommon.dart';

main() {
  //test img
  test(() {

    var d = document;

    // create element
    var el = d.createElement('img');
    d.body.append(el);

    var s = createSR(el);

    s.setInnerHtml( '<content id="cont" select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(s.querySelector('#cont') != null, 'img should allow one insertion point ' +
      'that matches nothing');

  }, 'A_09_00_02_T01');


  //test embed
  test(() {

    var d = document;

    // create element
    var el = d.createElement('embed');
    d.body.append(el);

    var s = createSR(el);

    s.setInnerHtml( '<content id="cont" select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(s.querySelector('#cont') != null, 'embed should allow one insertion point ' +
      'that matches nothing');

  }, 'A_09_00_02_T02');


  //test input
  test(() {

    var d = document;

    // create element
    var el = d.createElement('input');
    d.body.append(el);

    var s = createSR(el);

    s.setInnerHtml( '<content id="cont" select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(s.querySelector('#cont') != null, 'input should allow one insertion point ' +
      'that matches nothing');

  }, 'A_09_00_02_T03');
}
