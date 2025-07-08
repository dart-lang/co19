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
/// @description Checks that when an instance of a class annotated with
/// `@JSExport()` is passed to `createJSInteropWrapper`, the method returns a JS
/// object that contains a property for each of the class' instance members.
/// Test type variables.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

@JSExport()
class C<X, Y> {
  X variable;
  X method(Y y) {
    log = "method($y) => $variable;";
    return variable;
  }
  X get getter => variable;
  void set setter(Y y) {
    log = "setter($y);";
  }
  C(this.variable);
}

void main() {
  var c = C<int, String>(42);
  var jsC = createJSInteropWrapper<C<int, String>>(c);
  globalContext["jsC"] = jsC;
  eval(r'''
    globalThis.v1 = globalThis.jsC.variable;
    globalThis.v2 = globalThis.jsC.method('x');
    globalThis.v3 = globalThis.jsC.getter;
  ''');
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("method(x) => 42;", log);
  Expect.equals(42, (globalContext["v3"] as JSNumber).toDartInt);

  eval("globalThis.jsC.setter = 'z';");
  Expect.equals("setter(z);", log);
}
