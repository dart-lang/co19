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
import '../../testcommon.dart';

main() {
  //gaining and loosing focus elements are in the same tree.
  //DOMFocusOut event should be stopped at shadow boundary

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
    s.append(inp2);

    inp1.focus();

    d.body.addEventListener('DOMFocusOut', (event) {
      assert_true(false, 'Event should be stopped at Shadow boundary');
    }, false);

    inp2.focus();

  }, 'A_05_03_01_T04');
}
