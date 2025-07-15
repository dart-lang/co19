// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation that indicates a JS annotated class is structural
/// and does not have a known JavaScript prototype.
///
/// A class marked with [anonymous] must have an unnamed factory constructor
/// with no positional arguments, only named arguments. Invoking the constructor
/// desugars to creating a JavaScript object literal with name-value pairs
/// corresponding to the parameter names and values.
///
/// @description Checks that invoking the constructor desugars to creating a
/// JavaScript object literal with name-value pairs corresponding to the
/// parameter names and values. Test a named factory constructor.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

@anonymous
@staticInterop
@JS()
class C {
  external factory C.f({String s, int n, bool b});
}

main() {
  var c = C.f(s: "s value", n: 42, b: true);
  globalContext["c"] = c as JSObject;
  eval(r'''
    globalThis.resS = globalThis.c.s;
    globalThis.resN = globalThis.c.n;
    globalThis.resB = globalThis.c.b;
  ''');
  Expect.equals("s value", (globalContext["resS"] as JSString).toDart);
  Expect.equals(42, (globalContext["resN"] as JSNumber).toDartInt);
  Expect.equals(true, (globalContext["resB"] as JSBoolean).toDart);
}
