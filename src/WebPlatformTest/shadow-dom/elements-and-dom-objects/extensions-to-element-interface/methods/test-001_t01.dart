/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Extensions to Element Interface: createShadowRoot method creates
 * new instance of Shadow root object
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {

  var d = newHTMLDocument();

  var host = d.createElement('div');
  d.body.append(host);

  var s = host.createShadowRoot();

  assert_true(s is ShadowRoot, 'createShadowRoot() method should create new instance ' +
      'of ShadowRoot object');
}

