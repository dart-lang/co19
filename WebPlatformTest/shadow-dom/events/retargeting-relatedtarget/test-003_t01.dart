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
 * @assertion Retargeting relatedTarget: Event listeners must not be invoked
 * on a node for which the target and relatedTarget are the same.
 */

import 'dart:html';
import '../../testcommon.dart';

main() {

  var d = document;

  var host = d.createElement('div');
  host.setAttribute('style', 'height:50%; width:100%');
  host.setAttribute('id', 'host');
  d.body.append(host);

  //Shadow root to play with
  var s = createSR(host);

  var div1 = d.createElement('div');
  div1.setAttribute('style', 'height:100%; width:100%');
  div1.setAttribute('id', 'div1');
  s.append(div1);

  var div2 = d.createElement('div');
  div2.setAttribute('style', 'height:100%; width:100%');
  div2.setAttribute('id', 'div2');
  s.append(div2);

  s.addEventListener('mouseover', (event) {
    assert_true(false, 'Event listners shouldn\'t be invoked if target and relatedTarget are the same');
  }, false);

  var evt = new MouseEvent("mouseover", canBubble: true, cancelable: false,
      view: window, detail: 0,
      screenX: 10, screenY: 10, clientX: 10, clientY: 10,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: div1);

  div1.dispatchEvent(evt);
}
