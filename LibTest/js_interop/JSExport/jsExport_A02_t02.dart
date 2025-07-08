// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion By default, the property will have the same name as the
/// corresponding instance member. You can change the property name of a member
/// in the JS object by providing a `name` in the `@JSExport` annotation on the
/// member.
///
/// @description Checks that if a class is annotated with  a `@JSExport` then
/// its instance members still can be annotated.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

@JSExport()
class C {
  @JSExport()
  int annotatedVariable = 42;
  @JSExport()
  String annotatedMethod(String v) => "annotatedMethod($v);";
  @JSExport()
  String get annotatedGetter => "Some annotatedGetter";
  @JSExport()
  void set annotatedSetter(bool value) {
    log = "annotatedSetter($value);";
  }

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
    globalThis.v1 = globalThis.jsC.annotatedVariable;
    globalThis.v2 = globalThis.jsC.annotatedMethod('x');
    globalThis.v3 = globalThis.jsC.annotatedGetter;
    globalThis.jsC.annotatedSetter = false;
    
    globalThis.v4 = globalThis.jsC.variable;
    globalThis.v5 = globalThis.jsC.method('y');
    globalThis.v6 = globalThis.jsC.getter;
  ''');
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("annotatedMethod(x);", (globalContext["v2"] as JSString).toDart);
  Expect.equals("Some annotatedGetter", (globalContext["v3"] as JSString).toDart);
  Expect.equals("annotatedSetter(false);", log);

  eval("globalThis.jsC.setter = false;");
  Expect.equals(42, (globalContext["v4"] as JSNumber).toDartInt);
  Expect.equals("method(y);", (globalContext["v5"] as JSString).toDart);
  Expect.equals("Some getter", (globalContext["v6"] as JSString).toDart);
  Expect.equals("setter(false);", log);
}
