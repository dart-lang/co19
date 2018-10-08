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
 * @assertion Event Retargeting: test that event.target is retargeted when 
 * event crosses shadow boundary and vice versa
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var d = document;

    var div = d.createElement('div');
    d.body.append(div);

    var s = createSR(div);

    var div2 = d.createElement('div');
    s.append(div2);

    var inp = d.createElement('input');
    inp.setAttribute('type', 'text');
    inp.setAttribute('id', 'inpid');
    div2.append(inp);

    asyncStart();

    div2.addEventListener('click', (dynamic event) {
      assert_equals(event.target.tagName, 'INPUT', 'Information about target of the event that ' +
        'doesn\'t cross the shadow boundaries should not be adjusted');
      asyncEnd();
    }, false);

    var event = new Event("click", canBubble:true, cancelable:false);
    inp.dispatchEvent(event);
  }, 'A_05_01_01_T1');

  test(() {
    var d = document;

    var div = d.createElement('div');
    d.body.append(div);

    var s = createSR(div);

    var div2 = d.createElement('div');
    s.append(div2);

    var inp = d.createElement('input');
    inp.setAttribute('type', 'text');
    inp.setAttribute('id', 'inpid');
    div2.append(inp);

    asyncStart();

    div.addEventListener('click', (dynamic event) {
      assert_equals(event.target.tagName, 'DIV', 'Information about event target crossing ' +
        'the shadow boundaries should be adjusted');
      asyncEnd();
    }, false);

    var event = new Event("click", canBubble:true, cancelable:false);
    inp.dispatchEvent(event);
  }, 'A_05_01_01_T2');
}
