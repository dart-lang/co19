// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSExportedDartFunction get toJS
/// A callable JavaScript function that wraps this [Function].
///
/// @description Check that this property returns a JavaScript function that
/// wraps this Dart [Function].
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

int foo() => 42;

@JS()
String bar(String v) => v;

main() {
  globalContext["jsFoo"] = foo.toJS;
  eval("globalThis.res1 = globalThis.jsFoo();");
  Expect.equals(42, (globalContext["res1"] as JSNumber).toDartInt);

  globalContext["jsBar"] = bar.toJS;
  eval("globalThis.res2 = globalThis.jsBar('x');");
  Expect.equals("x", (globalContext["res2"] as JSString).toDart);
}
