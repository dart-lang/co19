// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion By default, the property will have the same name as the
/// corresponding instance member. You can change the property name of a member
/// in the JS object by providing a `name` in the `@JSExport` annotation on the
/// member.
///
/// @description Checks that `name` value is trimmed.
/// @author sgrekhov22@gmail.com
/// @issue 61096

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

class C {
  @JSExport(" variable ")
  int annotatedVariable = 42;
  @JSExport(" method " )
  String annotatedMethod(String v) => "method($v);";
  @JSExport(" getter ")
  String get annotatedGetter => "Some getter";
  @JSExport(" setter ")
  void set annotatedSetter(bool value) {
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

    globalThis.v4 = globalThis.jsC.annotatedVariable;
    globalThis.v5 = globalThis.jsC.annotatedMethod;
    globalThis.v6 = globalThis.jsC.annotatedGetter;
  ''');
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("method(x);", (globalContext["v2"] as JSString).toDart);
  Expect.equals("Some getter", (globalContext["v3"] as JSString).toDart);
  Expect.equals("setter(false);", log);

  log = "";
  eval("globalThis.jsC.annotatedSetter = false;");
  Expect.isNull(globalContext["v4"]);
  Expect.isNull(globalContext["v5"]);
  Expect.isNull(globalContext["v6"]);
  Expect.equals("", log);
}
