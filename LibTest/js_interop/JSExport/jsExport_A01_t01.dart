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
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

@JSExport()
class C {
  int variable = 42;
  String method(String v) => "method($v);";
  String get getter => "Some getter";
  void set setter(bool value) {
    log = "setter($value);";
  }
}

void main() {
  var c = C();
  var jsC = createJSInteropWrapper<C>(c);
  globalContext["jsC"] = jsC;
  eval(r'''
    globalThis.v1 = globalThis.jsC.variable;
    globalThis.v2 = globalThis.jsC.method('x');
    globalThis.v3 = globalThis.jsC.getter;
    globalThis.jsC.setter = false;
  ''');
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("method(x);", (globalContext["v2"] as JSString).toDart);
  Expect.equals("Some getter", (globalContext["v3"] as JSString).toDart);
  Expect.equals("setter(false);", log);
}
