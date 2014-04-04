/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot Object:The nodeName attribute of a ShadowRoot
 * instance must return "#document-fragment". 
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

    assert_equals(s.nodeName, '#document-fragment', 'The nodeName attribute of a ShadowRoot instance ' +
      'must return "#document-fragment".');
  }, 'A_10_01_01_07_T01');
}

