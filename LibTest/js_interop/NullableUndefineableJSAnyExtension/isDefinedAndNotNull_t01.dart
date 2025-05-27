// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool get isDefinedAndNotNull
///
/// @description Checks that this getter returns `true` if  this value is
/// defined (not `undefined`) and not `Null`. `false` otherwise.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

testTrue(JSAny? v) {
  Expect.isTrue(v.isDefinedAndNotNull);
}

testFalse(JSAny? v) {
  Expect.isFalse(v.isDefinedAndNotNull);
}

main() {
  eval(r'''
    var n = null;
    var u = undefined;
    var s = "s";
  ''');

  testFalse(globalContext["n"]);
  testTrue(42.toJS);
  testFalse(globalContext["u"]);
  testTrue(globalContext["s"]);
}
