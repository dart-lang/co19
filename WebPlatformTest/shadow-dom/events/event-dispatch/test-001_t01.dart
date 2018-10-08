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
 * @assertion Event Dispatch: At the time of event dispatch:
 * The Event target and currentTarget attributes must return the relative
 * target for the node on which event listeners are invoked
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

    //For #volume-slider-thumb relative target	#volume-slider-thumb
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb')
      .addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider-thumb',
        'Point 1: Wrong target');
      assert_equals(event.currentTarget.getAttribute('id'), 'volume-slider-thumb',
        'Point 1: Wrong currentTarget');
      asyncEnd();
    }, false);

    var event = new Event('click', canBubble:true, cancelable:false);
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb')
      .dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_05_01_T01');

  test(() {

    var d = document;

    var invoked = false;

    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #volume-shadow-root relative target	#volume-slider-thumb
    roots.volumeShadowRoot.addEventListener('click', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider-thumb',
        'Wrong target');
      assert_true(event.currentTarget == roots.volumeShadowRoot,
        'Wrong currentTarget');
      asyncEnd();
    }, false);

    var event = new Event('click', canBubble:true, cancelable:false);
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb')
      .dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_05_01_T02');

  test(() {

    var d = document;

    var invoked = false;

    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #volume-slider relative target #volume-slider
    roots.playerShadowRoot.querySelector('#volume-slider')
    .addEventListener('click', (dynamic event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong target');
      assert_equals(event.currentTarget.getAttribute('id'), 'volume-slider',
        'Wrong currentTarget');
      asyncEnd();
    }, false);

    var event = new Event('click', canBubble:true, cancelable:false);
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb')
      .dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_05_01_T03');

  test(() {

    var d = document;

    var invoked = false;

    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #volume-slider-container relative target #volume-slider
    roots.playerShadowRoot.querySelector('#volume-slider-container')
    .addEventListener('click', (dynamic event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong target');
      assert_equals(event.currentTarget.getAttribute('id'), 'volume-slider',
        'Wrong currentTarget');
      asyncEnd();
    }, false);

    var event = new Event('click', canBubble:true, cancelable:false);
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb')
      .dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');
  }, 'A_05_05_01_T04');

  test(() {

    var d = document;

    var invoked = false;

    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #controls relative target #volume-slider
    roots.playerShadowRoot.querySelector('#controls')
    .addEventListener('click', (dynamic event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong target');
      assert_equals(event.currentTarget.getAttribute('id'), 'volume-slider',
        'Wrong currentTarget');
      asyncEnd();
    }, false);

    var event = new Event('click', canBubble:true, cancelable:false);
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb')
      .dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_05_01_T05');

  test(() {

    var d = document;

    var invoked = false;

    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #player-shadow-root relative target #volume-slider
    roots.playerShadowRoot.addEventListener('click', (dynamic event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong target');
      assert_equals(event.currentTarget.getAttribute('id'), 'volume-slider',
        'Wrong currentTarget');
      asyncEnd();
    }, false);

    var event = new Event('click', canBubble:true, cancelable:false);
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb').dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_05_01_T06');

  test(() {

    var d = document;

    var invoked = false;

    var roots = createTestMediaPlayer(d);

    asyncStart();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #player relative target #player
    d.querySelector('#player').addEventListener('click', (dynamic event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'player',
        'Wrong target');
      assert_equals(event.currentTarget.getAttribute('id'), 'player',
        'Wrong currentTarget');
      asyncEnd();
    }, false);

    var event = new Event('click', canBubble:true, cancelable:false);
    roots.volumeShadowRoot.querySelector('#volume-slider-thumb').dispatchEvent(event);

    assert_true(invoked, 'Event listener was not invoked');

  }, 'A_05_05_01_T07');
}
