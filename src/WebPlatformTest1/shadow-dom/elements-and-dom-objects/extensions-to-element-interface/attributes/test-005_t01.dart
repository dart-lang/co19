/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Extensions to Element Interface:
 * shadowRoot of type ShadowRoot
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  var d = newHTMLDocument();

  var host = d.createElement('div');
  d.body.append(host);

  //old tree
  var s1 = createSR(host);
  //young tree
  var s2 = createSR(host);

  assert_equals(host.shadowRoot, s2, 'attribute shadowRoot must return the youngest tree that has ' +
      'the context object as its shadow host');
}
