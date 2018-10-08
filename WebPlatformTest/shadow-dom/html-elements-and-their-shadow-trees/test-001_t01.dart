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
 * @assertion HTML Elements and Their Shadow Trees: If the element can have 
 * fallback content, UA should allow the shadow tree to contain at least one 
 * insertion point.
 */

import 'dart:html';
import '../testcommon.dart';

main() {
  //test iframe
  /*test(() {

    var d = document;

    // create element
    var el = d.createElement('iframe');
    d.body.append(el);

    el.setInnerHtml( '' + 
      '<span id="shadow">This is a node that should be distributed</span>' +
      '<span id="flbk">This is a fallback content</span>',
      treeSanitizer: new NullTreeSanitizer());

    var s = createSR(el);
    s.setInnerHtml( '<content select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(d.querySelector('#shadow').offsetTop > 0, 'Iframe should allow at least one insertion point');
    assert_equals(d.querySelector('#flbk').offsetTop, 0, 'Fallback content shouldn\'t be rendered');

  }, 'A_09_00_01_T01');*/

  //test object
  test(() {

    var d = document;

    // create element
    var el = d.createElement('object');
    d.body.append(el);

    el.setInnerHtml( '' +
      '<span id="shadow">This is a node that should be distributed</span>' +
      '<span id="flbk">This is a fallback content</span>',
      treeSanitizer: new NullTreeSanitizer());

    var s = createSR(el);
    s.setInnerHtml( '<content select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(d.querySelector('#shadow').offsetTop > 0, 'object should allow at least one insertion point');
    assert_equals(d.querySelector('#flbk').offsetTop, 0, 'Fallback content shouldn\'t be rendered');

  }, 'A_09_00_01_T02');


  //test video
  test(() {

    var d = document;

    // create element
    var el = d.createElement('video');
    d.body.append(el);

    el.setInnerHtml( '' +
      '<span id="shadow">This is a node that should be distributed</span>' +
      '<span id="flbk">This is a fallback content</span>',
      treeSanitizer: new NullTreeSanitizer());

    var s = createSR(el);
    s.setInnerHtml( '<content select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(d.querySelector('#shadow').offsetTop > 0, 'video should allow at least one insertion point');
    assert_equals(d.querySelector('#flbk').offsetTop, 0, 'Fallback content shouldn\'t be rendered');

  }, 'A_09_00_01_T03');


  //test audio
  test(() {

    var d = document;

    // create element
    var el = d.createElement('audio');
    d.body.append(el);

    el.setInnerHtml( '' +
      '<span id="shadow">This is a node that should be distributed</span>' +
      '<span id="flbk">This is a fallback content</span>',
      treeSanitizer: new NullTreeSanitizer());

    var s = createSR(el);
    s.setInnerHtml( '<content select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(d.querySelector('#shadow').offsetTop > 0, 'audio should allow at least one insertion point');
    assert_equals(d.querySelector('#flbk').offsetTop, 0, 'Fallback content shouldn\'t be rendered');

  }, 'A_09_00_01_T04');


  //test canvas
  test(() {

    var d = document;

    // create element
    var el = d.createElement('canvas');
    d.body.append(el);

    el.setInnerHtml( '' +
      '<span id="shadow">This is a node that should be distributed</span>' +
      '<span id="flbk">This is a fallback content</span>',
      treeSanitizer: new NullTreeSanitizer());

    var s = createSR(el);
    s.setInnerHtml( '<content select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(d.querySelector('#shadow').offsetTop > 0, 'canvas should allow at least one insertion point');
    assert_equals(d.querySelector('#flbk').offsetTop, 0, 'Fallback content shouldn\'t be rendered');

  }, 'A_09_00_01_T05');


  //test map
  test(() {

    var d = document;

    var img = d.createElement('img');
    img.setAttribute('usemap', '#theMap');
    img.setAttribute('width', '20px');
    img.setAttribute('height', '20px');
    d.body.append(img);


    // create element
    var el = d.createElement('map');
    el.setAttribute('name', 'theMap');
    d.body.append(el);

    el.setInnerHtml( '' +
      '<span id="shadow">This is a node that should be distributed</span>' +
      '<span id="flbk">This is a fallback content</span>',
      treeSanitizer: new NullTreeSanitizer());


    var s = createSR(el);
    s.setInnerHtml( '<content select="#shadow"></content>',
        treeSanitizer: new NullTreeSanitizer());

    assert_true(d.querySelector('#shadow').offsetTop > 0, 'map should allow at least one insertion point');
    assert_equals(d.querySelector('#flbk').offsetTop, 0, 'Fallback content shouldn\'t be rendered');

  }, 'A_09_00_01_T06');


  //test textarea
  test(() {

    var d = document;

    // create element
    var el = d.createElement('textarea');
    d.body.append(el);

    el.setInnerHtml( '' +
      '<span id="shadow">This is a node that should be distributed</span>' +
      '<span id="flbk">This is a fallback content</span>',
      treeSanitizer: new NullTreeSanitizer());

    var s = createSR(el);
    s.setInnerHtml( '<content select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(d.querySelector('#shadow').offsetTop > 0, 'textarea should allow at least one insertion point');
    assert_equals(d.querySelector('#flbk').offsetTop, 0, 'Fallback content shouldn\'t be rendered');

  }, 'A_09_00_01_T07');

  //test progress
  test(() {

    var d = document;

    // create element
    var el = d.createElement('progress');
    d.body.append(el);

    el.setInnerHtml( '' +
      '<span id="shadow">This is a node that should be distributed</span>' +
      '<span id="flbk">This is a fallback content</span>',
      treeSanitizer: new NullTreeSanitizer());

    var s = createSR(el);
    s.setInnerHtml( '<content select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(d.querySelector('#shadow').offsetTop > 0, 'progress should allow at least one insertion point');
    assert_equals(d.querySelector('#flbk').offsetTop, 0, 'Fallback content shouldn\'t be rendered');

  }, 'A_09_00_01_T08');


  //test meter
  test(() {

    var d = document;

    // create element
    var el = d.createElement('meter');
    d.body.append(el);

    el.setInnerHtml( '' +
      '<span id="shadow">This is a node that should be distributed</span>' +
      '<span id="flbk">This is a fallback content</span>',
      treeSanitizer: new NullTreeSanitizer());

    var s = createSR(el);
    s.setInnerHtml( '<content select="#shadow"></content>',
      treeSanitizer: new NullTreeSanitizer());

    assert_true(d.querySelector('#shadow').offsetTop > 0, 'meter should allow at least one insertion point');
    assert_equals(d.querySelector('#flbk').offsetTop, 0, 'Fallback content shouldn\'t be rendered');

  }, 'A_09_00_01_T09');
}
