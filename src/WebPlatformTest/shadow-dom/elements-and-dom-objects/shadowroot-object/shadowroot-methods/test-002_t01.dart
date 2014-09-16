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
 * @assertion ShadowRoot Object: NodeList getElementsByClassName(DOMString className) method
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

    assert_equals(s.getElementsByClassName('clazz').length, 0, 'ShadowRoot getElementsByClassName() ' +
      'method should return empty list if there\'s no matching child elements');

  }, 'A_10_01_02_02_T01');



  test(() {
    var d = newHTMLDocument();

    var el = d.createElement('div');
    d.body.append(el);

    var s = createSR(el);

    var child = d.createElement('span');
    child.setAttribute('class', 'clazz');
    s.append(child);

    assert_equals(s.getElementsByClassName('clazz').length, 1, 'ShadowRoot getElementsByClassName() ' +
      'method should return matching child element');

  }, 'A_10_01_02_02_T02');


  test(() {
    var d = newHTMLDocument();

    var el = d.createElement('div');
    d.body.append(el);

    var s = createSR(el);

    var child = d.createElement('span');
    child.setAttribute('class', 'clazz');
    s.append(child);

    var child2 = d.createElement('span');
    child2.setAttribute('class', 'clazz');
    s.append(child2);

    assert_equals(s.getElementsByClassName('clazz').length, 2, 'ShadowRoot getElementsByClassName() ' +
      'method should return matching child elements');

  }, 'A_10_01_02_02_T03');
}
