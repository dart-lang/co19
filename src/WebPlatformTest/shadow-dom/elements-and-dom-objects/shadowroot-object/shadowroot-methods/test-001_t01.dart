/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot Object: HTMLElement getElementById(DOMString elementId) method
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  test(() {
    var d = newHTMLDocument();

    var el = d.createElement('div');
    d.body.append(el);

    var s = createSR(el);

    var child = d.createElement('span');
    child.setAttribute('id', 'span_id');
    s.append(child);

    assert_true(s.getElementById('span_id') != null, 'Point 1: ShadowRoot getElementById() ' +
      'method should return child element');
    assert_equals(s.getElementById('span_id').getAttribute('id'), 'span_id', 'Point 2: ' +
      'ShadowRoot getElementById() method should return child element');

  }, 'A_10_01_02_01_T01');

  test(() {
    var d = newHTMLDocument();

    var el = d.createElement('div');
    d.body.append(el);

    var s = createSR(el);

    assert_true(s.getElementById('span_id') == null, ' ShadowRoot getElementById() ' +
      'method should return null if matching element not found');

  }, 'A_10_01_02_01_T02');
}
