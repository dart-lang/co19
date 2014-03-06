/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot Object: readonly attribute Element activeElement;
 * actual value
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

    var inp = d.createElement('input');
    inp.setAttribute('type', 'text');
    inp.setAttribute('id', 'inpId');
    inp.setAttribute('value', 'Some text');
    s.append(inp);

    inp.focus();

    assert_true(s.activeElement != null, 'Point 1: activeElement attribute of the ShadowRoot ' +
      'must return the currently focused element in the shadow tree');
    assert_equals(s.activeElement.tagName, 'INPUT', 'Point 2: activeElement attribute of the ShadowRoot ' +
      'must return the currently focused element in the shadow tree');
  }, 'A_10_01_01_03_01_T01');
}
