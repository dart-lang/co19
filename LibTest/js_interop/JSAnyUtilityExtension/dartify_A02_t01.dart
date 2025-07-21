// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Object? dartify()
/// Converts a JavaScript value to the Dart equivalent if possible.
///
/// Effectively the inverse of `NullableObjectUtilExtension.jsify`, `dartify`
/// takes a JavaScript value and recursively converts it to a Dart object. Only
/// JavaScript primitives, `Arrays`, typed arrays, and map-like objects with
/// string property names are supported.
///
/// @description Checks that `dartify()` converts `JSExportedDartFunction`
/// function to Dart function.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';

String foo() => "I'm foo from Dart";

main() {
  JSExportedDartFunction jsFoo = foo.toJS;
  globalContext["jsFoo"] = jsFoo;
  Expect.equals(foo(), (globalContext["jsFoo"].dartify() as Function)());
}
