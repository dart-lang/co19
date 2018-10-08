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
 * @assertion Event Retargeting: Retargeting algorithm
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example
    //For #volume-slider-thumb relative target is #volume-slider-thumb
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb')
    .addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider-thumb',
        'Wrong related target');
      asyncEnd();
    }, false);

  var event = new Event("click", canBubble:true, cancelable:false);
  roots.volumeShadowRoot.querySelector('#volume-slider-thumb')
    .dispatchEvent(event);

  assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_01_04_T01');

  test(() {
    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #volume-shadow-root relative target is #volume-slider-thumb
    roots.volumeShadowRoot.addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider-thumb',
        'Wrong related target');
      asyncEnd();
    }, false);

    var event = new Event("click", canBubble:true, cancelable:false);
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb').dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');
  }, 'A_05_01_04_T02'); 


  test(() {
    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #volume-slider relative target is #volume-slider
    roots.playerShadowRoot.querySelector('#volume-slider')
    .addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong related target');
      asyncEnd();
    }, false);

  var event = new Event("click", canBubble:true, cancelable:false);
  roots.volumeShadowRoot.querySelector('#volume-slider-thumb').dispatchEvent(event);

  assert_true(invoked, 'Event listener was not invoked');
  }, 'A_05_01_04_T03');

  test(() {
    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #volume-slider-container relative target is #volume-slider
    roots.playerShadowRoot.querySelector('#volume-slider-container')
    .addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong related target');
      asyncEnd();
    }, false);

    var event = new Event("click", canBubble:true, cancelable:false);
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb').dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_01_04_T04');

  test(() {
    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #controls relative target is #volume-slider
    roots.playerShadowRoot.querySelector('#controls')
    .addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong related target');
      asyncEnd();
    }, false);

  var event = new Event("click", canBubble:true, cancelable:false);
  roots.volumeShadowRoot.querySelector('#volume-slider-thumb').dispatchEvent(event);

  assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_01_04_T05');

  test(() {

    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #player-shadow-root relative target is #volume-slider
    roots.playerShadowRoot.addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong related target');
      asyncEnd();
    }, false);

    var event = new Event("click", canBubble:true, cancelable:false);
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb').dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_01_04_T06');

  test(() {

    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #player relative target is #player
    d.querySelector('#player').addEventListener('click', (dynamic event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'player',
        'Wrong related target');
      asyncEnd();
    }, false);

    var event = new Event("click", canBubble:true, cancelable:false);
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb').dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_01_04_T07');
 
  test(() {
    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #volume-slider relative target is #volume-slider
    roots.playerShadowRoot.querySelector('#volume-slider')
    .addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong related target');
      asyncEnd();
    }, false);

    var event = new Event("click", canBubble:true, cancelable:false);
    roots.playerShadowRoot.querySelector('#volume-slider').dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_01_04_T08');

  test(() {
    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #volume-slider-container relative target is #volume-slider
    roots.playerShadowRoot.querySelector('#volume-slider-container')
    .addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong related target');
      asyncEnd();
    }, false);

    var event = new Event("click", canBubble:true, cancelable:false);
    roots.playerShadowRoot.querySelector('#volume-slider').dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_01_04_T09');

  test(() {
    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #controls relative target is #volume-slider
    roots.playerShadowRoot.querySelector('#controls')
    .addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong related target');
      asyncEnd();
    }, false);

    var event = new Event("click", canBubble:true, cancelable:false);
    roots.playerShadowRoot.querySelector('#volume-slider').dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_01_04_T10');


  test(() {
    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #player-shadow-root relative target is #volume-slider
    roots.playerShadowRoot.addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong related target');
      asyncEnd();
    }, false);

    var event = new Event("click", canBubble:true, cancelable:false);
    roots.playerShadowRoot.querySelector('#volume-slider').dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_01_04_T11');

  test(() {
    var d = document;
    var invoked = false;
    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #player relative target is #player
    d.querySelector('#player').addEventListener('click', (dynamic event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'player',
        'Wrong related target');
      asyncEnd();
    }, false);

    var event = new Event("click", canBubble:true, cancelable:false);
    roots.playerShadowRoot.querySelector('#volume-slider').dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_01_04_T12');
}
