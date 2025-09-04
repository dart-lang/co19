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
/// @description Check that any extra arguments passed to JS are just ignored.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

int foo(JSObject pThis) {
  Expect.equals(globalContext, pThis);
  return 42;
}

@JS()
String bar(JSObject pThis, String v) {
  Expect.equals(globalContext, pThis);
  return v;
}

main() {
  globalContext["jsFoo"] = foo.toJSCaptureThis;
  eval("globalThis.res1 = globalThis.jsFoo(1, '2', true);");
  Expect.equals(42, (globalContext["res1"] as JSNumber).toDartInt);

  globalContext["jsBar"] = bar.toJSCaptureThis;
  eval("globalThis.res2 = globalThis.jsBar('x', 1, []);");
  Expect.equals("x", (globalContext["res2"] as JSString).toDart);
}
