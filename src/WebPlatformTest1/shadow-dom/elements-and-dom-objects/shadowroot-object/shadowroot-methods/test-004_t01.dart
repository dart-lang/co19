/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot Object: Selection getSelection() method
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

    var span = d.createElement('span');
    span.innerHtml = 'Some text';
    s.append(span);

    var range = d.createRange();
    range.setStart(span.firstChild, 0);
    range.setEnd(span.firstChild, 3);

    var selection = window.getSelection();
    selection.removeAllRanges();
    selection.addRange(range);

    var sl = s.getSelection();
    assert_equals(sl.toString(), 'Som', 'The getSelection() method of the shadow root object must return ' +
      'the current selection in this shadow tree');

  }, 'A_10_01_02_04_T01');
}
