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
 * @assertion Event Dispatch: The MouseEvent relatedTarget attribute must 
 * return the adjusted related target
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {

  var d = document;

  var invoked = false;

  var roots = createTestMediaPlayer(d);

  asyncStart();

  //expected result of what relative target should be see
  //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

  //For #volume-shadow-root adjusted related target #volume-shadow-root
  roots.volumeShadowRoot.addEventListener('mouseover', (event) {
    invoked = true;
    assert_true(event.relatedTarget == roots.volumeShadowRoot,
      'Wrong relatedTarget');
    asyncEnd();
  }, false);

  var evt = new MouseEvent("mouseover", canBubble: true, cancelable: false,
      view: window, detail: 0,
      screenX: 10, screenY: 10, clientX: 10, clientY: 10,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: roots.volumeShadowRoot);

  roots.volumeShadowRoot.querySelector('#volume-slider-thumb')
    .dispatchEvent(evt);
  assert_true(invoked, 'Event listener was not invoked');
}
