// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool get isUndefined
/// Whether this value corresponds to JavaScript `undefined`.
///
/// @description Checks if this value corresponds to JavaScript `undefined`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

testTrue(JSAny? v) {
  Expect.isTrue(v.isUndefined);
}

testFalse(JSAny? v) {
  Expect.isFalse(v.isUndefined);
}

main() {
  eval(r'''
    var n = null;
    var u = undefined;
    var s = "s";
  ''');

  testFalse(globalContext["n"]);
  testFalse(42.toJS);
  testTrue(globalContext["u"]);
  testFalse(globalContext["s"]);
}
