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
 * @assertion HTML Elements in shadow trees: link element must behave as 
 * inert not as part of the document tree
 */

import 'dart:html';
import '../../testcommon.dart';

main() {
  var d = document;
  
  int saveLength = d.styleSheets.length;

  var link = d.createElement('link');
  link.setAttribute('href', '/root_dart/tests/co19/src/WebPlatformTest1/shadow-dom/html-elements-in-shadow-trees/inert-html-elements/test.css');
  link.setAttribute('rel', 'stylesheet');

  //create Shadow root
  var root = d.createElement('div');
  d.body.append(root);
  var s = createSR(root);

  s.append(link);

  assert_equals(d.styleSheets.length, saveLength, 'link element must behave as inert not as part of the document tree');
}
