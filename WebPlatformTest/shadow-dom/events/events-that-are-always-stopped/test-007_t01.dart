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
 * @assertion The following events should not be stopped at the nearest
 * shadow boundary: abort, error, select, change, load, reset, resize, scroll,
 * selectstart
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  var d = document;

  var host = d.createElement('div');
  host.setAttribute('style', 'height:50%; width:100%');
  host.setAttribute('id', 'host');
  d.body.append(host);

  //Shadow root to play with
  var s = createSR(host);

  var inp1 = d.createElement('input');
  inp1.setAttribute('id', 'inp1');
  inp1.setAttribute('type', 'text');
  inp1.setAttribute('value', '12345');
  s.append(inp1);

  asyncStart();

  s.addEventListener('resize', (event) {
    assert_equals(event.target.getAttribute('id'), 'inp1', 'Inside shadow tree: Wrong target');
  }, false);

  d.body.addEventListener('resize', (event) {
    Element e = event.target as Element;
    assert_equals(e.getAttribute('id'), 'host', 'Outside shadow tree: Wrong target');
    asyncEnd();
  }, false);

  var event = new Event("resize", canBubble: true, cancelable: false);
  inp1.dispatchEvent(event);
}
