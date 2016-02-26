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
 * The nodes are accessible using shadow root's DOM tree accessor methods.
 */

import 'dart:html';
import '../../testcommon.dart';

main() {
  assert_singleton_node_list(nodeList, expectedNode) {
    assert_equals(nodeList.length, 1);
    assert_equals(nodeList[0], expectedNode);
  }

  test(() {
    var doc = document.implementation.createHtmlDocument('Test');
    var shadowRoot = doc.body.createShadowRoot();
    var div = doc.createElement('div');
    div.id = 'div-id';
    shadowRoot.append(div);

    assert_equals(shadowRoot.getElementById('div-id'), div);
  },
  'Elements in a shadow tree should be accessible via shadow root\'s ' +
  'getElementById() DOM tree accessor.'
  );
}
