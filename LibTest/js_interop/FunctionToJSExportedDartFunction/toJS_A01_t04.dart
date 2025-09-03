// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSExportedDartFunction get toJS
/// A callable JavaScript function that wraps this [Function].
///
/// @description Check that this property returns a JavaScript function that
/// wraps this Dart [Function]. Test primitive Dart and JS types as arguments.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String foo(String s, bool b, num n, int i, double d) {
  return "foo($s, $b, $n, $i, $d)";
}

JSString bar(JSString s, JSBoolean b, JSNumber n, JSBigInt? bi, JSSymbol? smb) {
  return "bar($s, $b, $n, $bi, $smb)".toJS;
}

main() {
  globalContext["jsFoo"] = foo.toJS;
  eval("globalThis.res1 = globalThis.jsFoo('x', true, 1.1, 2, 3.14);");
  Expect.equals(
    "foo(x, true, 1.1, 2, 3.14)",
    (globalContext["res1"] as JSString).toDart,
  );

  globalContext["jsBar"] = bar.toJS;
  eval(
    "globalThis.res2 = globalThis.jsBar('y', false, 1, null, null);",
  );
  Expect.equals(
    "bar(y, false, 1, null, null)",
    (globalContext["res2"] as JSString).toDart,
  );
}
