/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot Object: styleSheets of type StyleSheetList, readonly
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

    assert_true(s.styleSheets != null, 'ShadowRoot styleSheets attribute shouldn\'t be null');
    assert_equals(s.styleSheets.length, 0, 'attribute must return the shadow root style sheets only');

  }, 'A_10_01_01_05_01_T01');


  test(() {
    var d = document;

    var host = d.createElement('div');
    d.body.append(host);
    var s = createSR(host);

    var style = d.createElement('style');
    s.append(style);

    assert_true(s.styleSheets != null, 'ShadowRoot styleSheets attribute shouldn\'t be null');
    assert_equals(s.styleSheets.length, 1, 'attribute must return the shadow root style sheets');

  }, 'A_10_01_01_05_01_T02');
}
