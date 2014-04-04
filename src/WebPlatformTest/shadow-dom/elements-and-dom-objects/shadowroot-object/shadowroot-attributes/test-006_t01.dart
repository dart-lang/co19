/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot Object: attribute bool resetStyleInheritance
 * attribute. Test setter and getter
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  test(() {
    var d = document;

    var host = d.createElement('div');
    d.body.append(host);

    var s = createSR(host);
    s.resetStyleInheritance = true;

    assert_equals(s.resetStyleInheritance, true, 'attribute must return the current value of the ' +
      'reset-style-inheritance flag');

  }, 'A_10_01_01_02_03_T01');


  test(() {
    var d = document;

    var host = d.createElement('div');
    d.body.append(host);

    var s = createSR(host);
    s.resetStyleInheritance = false;

    assert_equals(s.resetStyleInheritance, false, 'attribute must return the current value of the ' +
      'reset-style-inheritance flag');

  }, 'A_10_01_01_02_03_T02');

  test(() {
    var d = document;

    var host = d.createElement('div');
    d.body.append(host);

    var s = createSR(host);
    s.resetStyleInheritance = true;

    assert_equals(s.resetStyleInheritance, true, 'attribute must return the current value of the ' +
      'reset-style-inheritance flag');

    s.resetStyleInheritance = false;

    assert_equals(s.resetStyleInheritance, false, 'attribute must change the value of the ' +
      'reset-style-inheritance flag');

  }, 'A_10_01_01_02_03_T03');
}
