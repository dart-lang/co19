/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot Object: The nodeType attribute of a ShadowRoot
 * instance must return DOCUMENT_FRAGMENT_NODE
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

    assert_equals(s.nodeType, Node.DOCUMENT_FRAGMENT_NODE /*11*/, 'The nodeType attribute of a ShadowRoot ' +
      'instance must return DOCUMENT_FRAGMENT_NODE');
  }, 'A_10_01_01_06_T01');
}
