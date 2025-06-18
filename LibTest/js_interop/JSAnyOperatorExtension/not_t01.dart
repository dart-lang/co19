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
    globalThis.t = this;
    globalThis.one = 1;
    globalThis.string = "s";
    globalThis.a = [];
    globalThis.o = {};
    globalThis.f = function() {};
    
    globalThis.zero = 0;
    globalThis.n = null;
    globalThis.u = undefined;
  ''');

  Expect.isFalse(globalContext["t"].not.toDart);
  Expect.isFalse(globalContext["one"].not.toDart);
  Expect.isFalse(globalContext["string"].not.toDart);
  Expect.isFalse(globalContext["a"].not.toDart);
  Expect.isFalse(globalContext["o"].not.toDart);
  Expect.isFalse(globalContext["f"].not.toDart);
  Expect.isFalse(42.toJS.not.toDart);
  Expect.isFalse("s".toJS.not.toDart);
  Expect.isFalse("0".toJS.not.toDart);
  Expect.isFalse([].jsify().not.toDart);
  Expect.isFalse([1, 2].jsify().not.toDart);

  Expect.isTrue(globalContext["zero"].not.toDart);
  Expect.isTrue(globalContext["n"].not.toDart);
  Expect.isTrue(globalContext["u"].not.toDart);
  Expect.isTrue(null.not.toDart);
  Expect.isTrue(null.jsify().not.toDart);
  Expect.isTrue(0.toJS.not.toDart);
  Expect.isTrue("".toJS.not.toDart);
  Expect.isTrue((0 / 0).toJS.not.toDart); // NaN
  }
