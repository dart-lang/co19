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
/// wraps this Dart [Function]. Test primitive Dart and JS types as arguments.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String foo(pThis, String s, bool b, num n, int i, double d) {
  Expect.equals(globalContext, pThis);
  return "foo($s, $b, $n, $i, $d)";
}

JSString bar(
  pThis,
  JSString s,
  JSBoolean b,
  JSNumber n,
  JSBigInt? bi,
  JSSymbol? smb,
) {
  Expect.equals(globalContext, pThis);
  return "bar($s, $b, $n, $bi, $smb)".toJS;
}

main() {
  globalContext["jsFoo"] = foo.toJSCaptureThis;
  eval("globalThis.res1 = globalThis.jsFoo('x', true, 1.1, 2, 3.14);");
  Expect.equals(
    "foo(x, true, 1.1, 2, 3.14)",
    (globalContext["res1"] as JSString).toDart,
  );

  globalContext["jsBar"] = bar.toJSCaptureThis;
  eval("globalThis.res2 = globalThis.jsBar('y', false, 1, null, null);");
  Expect.equals(
    "bar(y, false, 1, null, null)",
    (globalContext["res2"] as JSString).toDart,
  );
}
