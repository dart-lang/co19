/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot Object: NodeList getElementsBytagName(DOMString tagName) method
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

    assert_equals(s.getElementsByTagName('span').length, 0, 'ShadowRoot getElementsByTagName() ' +
      'method should return empty list if there\'s no matching child elements');

  }, 'A_10_01_02_05_T01');


  test(() {
    var d = newHTMLDocument();

    var el = d.createElement('div');
    d.body.append(el);

    var s = createSR(el);

    var child = d.createElement('span');
    s.append(child);

    assert_equals(s.getElementsByTagName('span').length, 1, 'ShadowRoot getElementsByTagName() ' +
      'method should return matching child element');

  }, 'A_10_01_02_05_T02');


  test(() {
    var d = newHTMLDocument();

    var el = d.createElement('div');
    d.body.append(el);

    var s = createSR(el);

    var child = d.createElement('span');
    s.append(child);

    var child2 = d.createElement('span');
    s.append(child2);

    assert_equals(s.getElementsByTagName('span').length, 2, 'ShadowRoot getElementsByTagName() ' +
      'method should return matching child elements');

  }, 'A_10_01_02_05_T03');
}
