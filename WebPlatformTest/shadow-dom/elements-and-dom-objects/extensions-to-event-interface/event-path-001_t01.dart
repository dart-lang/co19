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
 * @assertion Extensions to Event Interface: event.path crosses the shadow
 * boundary
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  var doc = document;
  var host = doc.createElement('div');

  var shadowRoot = createSR(host);
  var child = doc.createElement('div');

  doc.body.append(host);
  shadowRoot.append(child);

  asyncStart();

  child.addEventListener('click', (e) {
    assert_equals(e.path.length, 7, 'path.length');
    assert_equals(e.path[0], child, 'path[0] should be child');
    assert_equals(e.path[1], shadowRoot, 'path[1] should be shadowRoot');
    assert_equals(e.path[2], host, 'path[2] should be host');
    assert_equals(e.path[3], doc.body, 'path[3] should be body');
    assert_equals(e.path[4], doc.documentElement, 'path[4] should be html');
    assert_equals(e.path[5], doc, 'path[5] should be document');
    assert_equals(e.path[6], doc.window, 'path[6] should be window');

    asyncEnd();
  });

  var event = new Event('click', canBubble: true, cancelable: false);
  child.dispatchEvent(event);
}
