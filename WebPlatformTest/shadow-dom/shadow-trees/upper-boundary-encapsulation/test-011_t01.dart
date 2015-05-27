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
 * @assertion Upper-boundary encapsulation:
 * The style sheets, represented by the shadow nodes are not accessible using
 * shadow host document's CSSOM extensions
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  // check that <style> element added to head is not exposed
  test(() {
    var d = document;
    var initialStyleSheetsCount = d.styleSheets.length;
    var s = createSR(d.head);
    var style = d.createElement('style');
    s.append(style);

    Expect.equals(initialStyleSheetsCount, d.styleSheets.length,
      'style elements in shadow DOM must not be exposed via ' +
      'the document.styleSheets collection ');

  }, 'A_04_01_11_T1');

  // check that <link> element added to head is not exposed
  test(() {
    var d = document;
    var initialStyleSheetsCount = d.styleSheets.length;

    var link = d.createElement('link');
    link.setAttribute('href', '/root_dart/tests/co19/src/WebPlatformTest/shadow-dom/shadow-trees/upper-boundary-encapsulation/test.css');
    link.setAttribute('rel', 'stylesheet');
    d.body.append(link);

    //create Shadow root
    var root = d.createElement('div');
    d.body.append(root);
    var s = createSR(root);

    s.append(link);

    Expect.equals(initialStyleSheetsCount, d.styleSheets.length,
      'stylesheet link elements in shadow DOM must not be ' +
      'exposed via the document.styleSheets collection');

  }, 'A_04_01_11_T2');
}
