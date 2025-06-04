// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean get isTruthy
/// The result of `!!this` in JavaScript.
///
/// @description Check that `isTruthy` returns result of `!!this` in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    var t = this;
    var one = 1;
    var string = "s";
    var a = [];
    var o = {};
    var f = function() {};
    
    var zero = 0;
    var n = null;
    var u = undefined;
  ''');

  Expect.isTrue(globalContext["t"].isTruthy.toDart);
  Expect.isTrue(globalContext["one"].isTruthy.toDart);
  Expect.isTrue(globalContext["string"].isTruthy.toDart);
  Expect.isTrue(globalContext["a"].isTruthy.toDart);
  Expect.isTrue(globalContext["o"].isTruthy.toDart);
  Expect.isTrue(globalContext["f"].isTruthy.toDart);
  Expect.isTrue(42.toJS.isTruthy.toDart);
  Expect.isTrue("s".toJS.isTruthy.toDart);
  Expect.isTrue("0".toJS.isTruthy.toDart);
  Expect.isTrue([].jsify().isTruthy.toDart);
  Expect.isTrue([1, 2].jsify().isTruthy.toDart);

  Expect.isFalse(globalContext["zero"].isTruthy.toDart);
  Expect.isFalse(globalContext["n"].isTruthy.toDart);
  Expect.isFalse(globalContext["u"].isTruthy.toDart);
  Expect.isFalse(null.isTruthy.toDart);
  Expect.isFalse(null.jsify().isTruthy.toDart);
  Expect.isFalse(0.toJS.isTruthy.toDart);
  Expect.isFalse("".toJS.isTruthy.toDart);
  Expect.isFalse((0 / 0).toJS.isTruthy.toDart); // NaN
}
