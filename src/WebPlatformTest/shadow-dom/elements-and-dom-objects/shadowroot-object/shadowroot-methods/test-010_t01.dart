/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot Object: Invoking the cloneNode() method on a ShadowRoot instance must always throw a DATA_CLONE_ERR exception.
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

    Expect.throws(() =>  s.clone(false));
  }, 'A_10_01_02_09_T01');
}
