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
 * @assertion ShadowRoot Object: Element elementFromPoint(float x, float y) method
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  test(() {
    var d = newHTMLDocument();

    var el = d.createElement('div');
    d.body.append(el);

    Expect.throws(() => el.elementFromPoint(1, 1)); // not a ShadowRoot

  }, 'A_10_01_02_06_01_T01');
}
