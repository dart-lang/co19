// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Annotation to allow Dart classes to be wrapped with a JS object
/// using `dart:js_interop`'s `createJSInteropWrapper`.
///
/// When an instance of a class annotated with this annotation is passed to
/// `createJSInteropWrapper`, the method returns a JS object that contains a
/// property for each of the class' instance members. When called, these
/// properties forward to the instance's corresponding members.
///
/// @description Checks that uninitialized late instance variables of a class
/// annotated with `@JSExport()` are created by `createJSInteropWrapper` and
/// produce a runtime error when read before initialization.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JSExport()
class C {
  late int variable;

  void init() {
    variable = 42;
  }
}

void main() {
  var c = C();
  var jsC = createJSInteropWrapper<C>(c);
  globalContext["jsC"] = jsC;
  Expect.throws(() {
    eval("globalThis.jsC.variable;"); // LateInitializationError
  });

  c.init();
  eval("globalThis.v1 = globalThis.jsC.variable;");
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
}
