/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
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

    var s = createSR(el);

    var span = d.createElement('span');
    span.innerHtml = 'Some text';
    s.append(span);

    assert_equals(s.elementFromPoint(-1, 1), null, 'If x argument of elementFromPoint(x, y) is less ' +
      'than zero then method shold return null');

  }, 'A_10_01_02_06_02_T01');


  test(() {
    var d = newHTMLDocument();

    var el = d.createElement('div');
    d.body.append(el);

    var s = createSR(el);

    var span = d.createElement('span');
    span.innerHtml = 'Some text';
    s.append(span);

    assert_equals(s.elementFromPoint(1, -1), null, 'If y argument of elementFromPoint(x, y) is less ' +
      'than zero then method shold return null');

  }, 'A_10_01_02_06_02_T02');
}
