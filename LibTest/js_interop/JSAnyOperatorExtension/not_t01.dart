// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean get not
/// The result of `!this` in JavaScript.
///
/// @description Check that `not` returns result of `!this` in JavaScript.
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

  Expect.isFalse(globalContext["t"].not);
  Expect.isFalse(globalContext["one"].not);
  Expect.isFalse(globalContext["string"].not);
  Expect.isFalse(globalContext["a"].not);
  Expect.isFalse(globalContext["o"].not);
  Expect.isFalse(globalContext["f"].not);
  Expect.isFalse(JSObject().not);
  Expect.isFalse(42.toJS.not);
  Expect.isFalse("s".toJS.not);
  Expect.isFalse("0".toJS.not);
  Expect.isFalse([].jsify().not);
  Expect.isFalse([1, 2].jsify().not);
  Expect.isFalse((() {}).jsify().not);

  Expect.isTrue(globalContext["zero"].not);
  Expect.isTrue(globalContext["n"].not);
  Expect.isTrue(globalContext["u"].not);
  Expect.isTrue(null.not);
  Expect.isTrue(null.jsify().not);
  Expect.isTrue(0.toJS.not);
  Expect.isTrue("".toJS.not);
}
