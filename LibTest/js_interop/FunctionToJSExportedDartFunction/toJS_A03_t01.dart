// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSExportedDartFunction get toJS
/// ...
/// The max number of arguments that are passed to this [Function] from the
/// wrapper JavaScript function is determined by this [Function]'s static type.
/// Any extra arguments passed to the JavaScript function after the max number
/// of arguments are discarded like they are with regular JavaScript functions.
///
/// @description Check that any extra arguments passed to JS are just ignored.
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
  eval("globalThis.res1 = globalThis.jsFoo(1, '2', true);");
  Expect.equals(42, (globalContext["res1"] as JSNumber).toDartInt);

  globalContext["jsBar"] = bar.toJS;
  eval("globalThis.res2 = globalThis.jsBar('x', 1, []);");
  Expect.equals("x", (globalContext["res2"] as JSString).toDart);
}
