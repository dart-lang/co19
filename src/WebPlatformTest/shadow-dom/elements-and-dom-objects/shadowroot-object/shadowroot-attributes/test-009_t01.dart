/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot Object: innerHtml of type DOMString; Test getter
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

    assert_equals(s.innerHtml.toLowerCase(), '<span>some text</span>',
      'Wrong value of ShadowRoot innerHtml attribute');

  }, 'A_10_01_01_04_01_T01');
}
