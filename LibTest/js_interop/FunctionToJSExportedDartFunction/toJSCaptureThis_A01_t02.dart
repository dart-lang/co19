// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSExportedDartFunction get toJSCaptureThis
/// A callable JavaScript function that wraps this [Function] and captures the
/// `this` value when called.
///
/// Identical to `toJS`, except the resulting [JSExportedDartFunction] will pass
/// `this` from JavaScript as the first argument to the converted [Function].
/// Any [Function] that is converted with this member should take in an extra
/// parameter at the beginning of the parameter list to handle this.
///
/// @description Check that this property returns a JavaScript function that
/// wraps this [Function] and captures the `this` value when called. Test
/// methods.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

class A {
  int id;
  A(this.id);
}

class C {
  A a;
  C(): a = A(42);

  int foo(JSObject pThis) {
    Expect.equals(globalContext, pThis);
    return a.id;
  }
  static String bar(pThis, String v) {
    Expect.equals(globalContext, pThis);
    return v;
  }
}

main() {
  globalContext["jsFoo"] = C().foo.toJSCaptureThis;
  eval("globalThis.res1 = globalThis.jsFoo();");
  Expect.equals(42, (globalContext["res1"] as JSNumber).toDartInt);

  globalContext["jsBar"] = C.bar.toJSCaptureThis;
  eval("globalThis.res2 = globalThis.jsBar('x');");
  Expect.equals("x", (globalContext["res2"] as JSString).toDart);
}
