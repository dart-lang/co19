// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool get isNull
/// Whether this value corresponds to JavaScript `null`.
///
/// @description Checks if this value corresponds to JavaScript `null`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

testTrue(JSAny? v) {
  Expect.isTrue(v.isNull);
}

testFalse(JSAny? v) {
  Expect.isFalse(v.isNull);
}

main() {
  eval(r'''
    var n = null;
    var u = undefined;
    var s = "s";
  ''');

  testTrue(globalContext["n"]);
  testFalse(42.toJS);
  testFalse(globalContext["u"]);
  testFalse(globalContext["s"]);
}
