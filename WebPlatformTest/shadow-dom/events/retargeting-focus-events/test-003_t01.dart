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
 * @assertion Retargeting focus events:The focus event must be treated in the 
 * same way as events with a relatedTarget, where the corresponding node that 
 * is losing focus as a result of target gaining focus or the node that is 
 * gaining focus
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  var d = document;

  var invoked = false;

  var roots = createTestMediaPlayer(d);

  d.querySelector('#outside-control').focus();

  asyncStart();

  //expected result of what relative target should be see
  //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

  //For #volume-slider relative target is #volume-slider
  roots.playerShadowRoot.querySelector('.volume-slider')
    .addEventListener('focus', (event) {
      invoked = true;
      assert_equals(event.target.getAttribute('id'), 'volume-slider',
        'Wrong target');
      asyncEnd();
    }, false);

  roots.playerShadowRoot.querySelector('.volume-slider').focus();
}
