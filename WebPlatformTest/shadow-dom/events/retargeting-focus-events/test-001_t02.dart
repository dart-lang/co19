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
 * @assertion Retargeting focus events: The focus, DOMFocusIn, blur, and
 * DOMFocusOut events must be treated in the same way as events with a 
 * relatedTarget, where the corresponding node that is losing focus as a 
 * result of target gaining focus or the node that is gaining focus, and thus
 * causing the blurring of target acts as the related target
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  //blur and focus events are not bubbling. So this test tests only DOMFocusIn and DOMFocusOut
  //which do bubble

  //test DOMFocusIn event

  test(() {
    var d = document;

    var host = d.createElement('div');
    host.setAttribute('style', 'height:50%; width:100%');
    host.setAttribute('id', 'host');
    d.body.append(host);

    //Shadow root to play with
    var s = createSR(host);

    var inp1 = d.createElement('input');
    inp1.setAttribute('id', 'inp1');
    inp1.setAttribute('type', 'checkbox');
    s.append(inp1);

    var inp2 = d.createElement('input');
    inp2.setAttribute('id', 'inp2');
    inp2.setAttribute('type', 'checkbox');
    d.body.append(inp2);

    asyncMultiStart(2);

    inp2.focus();

    s.addEventListener('DOMFocusIn', (dynamic event) {
      assert_equals(event.target.getAttribute('id'), 'inp1', 'Inside shadoe tree: Wrong target');
      asyncEnd();
    }, false);

    d.body.addEventListener('DOMFocusIn', (dynamic event) {
      assert_equals(event.target.getAttribute('id'), 'host', 'Outside shadow tree: Wrong target');
      asyncEnd();
    }, false);

    inp1.focus();
  }, 'A_05_03_01_T02');
}
