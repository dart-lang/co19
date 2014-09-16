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
 * @assertion ShadowRoot Object: readonly attribute Element activeElement;
 * null value
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  test(() {
    var d = document;

    var host = d.createElement('div');
    host.setAttribute('id', 'shRoot');
    d.body.append(host);
    var s = createSR(host);

    assert_equals(s.activeElement, null, 'activeElement attribute of the ShadowRoot ' +
      'must return null if there\'s no focused element');

  }, 'A_10_01_01_03_02_T01');

  test(() {
    var d = document;

    var host = d.createElement('div');
    host.setAttribute('id', 'shRoot');
    d.body.append(host);
    var s = createSR(host);

    var inp = d.createElement('input');
    inp.setAttribute('type', 'text');
    inp.setAttribute('id', 'inpId');
    inp.setAttribute('value', 'Some text');
    d.body.append(inp);

    inp.focus();

    assert_equals(s.activeElement, null, 'activeElement attribute of the ShadowRoot ' +
      'must return null if there\'s no focused element in the shadow tree');

  }, 'A_10_01_01_03_02_T02_01');

  test(() {
    var d = document;

    var host = d.createElement('div');
    host.setAttribute('id', 'shRoot');
    d.body.append(host);
    var s = createSR(host);

    var inp = d.createElement('input');
    inp.setAttribute('type', 'text');
    inp.setAttribute('id', 'inpId');
    inp.setAttribute('value', 'Some text');
    d.body.append(inp);

    var inp2 = d.createElement('input');
    inp2.setAttribute('type', 'text');
    inp2.setAttribute('value', 'Some text 2');
    s.append(inp2);

    inp.focus();

    assert_equals(s.activeElement, null, 'activeElement attribute of the ShadowRoot ' +
        'must return null if there\'s no focused element in the shadow tree');

  }, 'A_10_01_01_03_02_T02_02');
}
