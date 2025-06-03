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

  Expect.isTrue(globalContext["t"].isTruthy);
  Expect.isTrue(globalContext["one"].isTruthy);
  Expect.isTrue(globalContext["string"].isTruthy);
  Expect.isTrue(globalContext["a"].isTruthy);
  Expect.isTrue(globalContext["o"].isTruthy);
  Expect.isTrue(globalContext["f"].isTruthy);
  Expect.isTrue(42.toJS.isTruthy);
  Expect.isTrue("s".toJS.isTruthy);
  Expect.isTrue("0".toJS.isTruthy);
  Expect.isTrue([].jsify().isTruthy);
  Expect.isTrue([1, 2].jsify().isTruthy);
  Expect.isTrue((() {}).jsify().isTruthy);

  Expect.isFalse(globalContext["zero"].isTruthy);
  Expect.isFalse(globalContext["n"].isTruthy);
  Expect.isFalse(globalContext["u"].isTruthy);
  Expect.isFalse(null.isTruthy);
  Expect.isFalse(null.jsify().isTruthy);
  Expect.isFalse(0.toJS.isTruthy);
  Expect.isFalse("".toJS.isTruthy);
}
