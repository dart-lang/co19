// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Classes and mixins in the hierarchy of the annotated class are
/// included only if they are annotated as well or specific members in them are
/// annotated. If a superclass does not have an annotation anywhere, its members
/// are not included.
///
/// @description Checks that if a superclass is annotated with `@JSExport()` and
/// specified as a type argument of `createJSInteropWrapper`, then the
/// superclass's members are included in the corresponding JS object, but the
/// members of the subclass are not.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

@JSExport()
class A {
  int aVariable = 42;
  String aMethod(String v) => "aMethod($v);";
  String get aGetter => "aGetter";
  void set aSetter(bool value) {
    log = "aSetter($value);";
  }
}

class C1 extends A {
  int cVariable = 0;
  String cMethod(String v) => "cMethod($v);";
  String get cGetter => "cGetter";
  void set cSetter(bool value) {
    log = "cSetter($value);";
  }
}

@JSExport()
class C2 extends A {
  int cVariable = 0;
  String cMethod(String v) => "cMethod($v);";
  String get cGetter => "cGetter";
  void set cSetter(bool value) {
    log = "cSetter($value);";
  }
}

void test(A a) {
  var jsA = createJSInteropWrapper<A>(a);
  globalContext["jsA"] = jsA;
  eval(r'''
    globalThis.v1 = globalThis.jsA.aVariable;
    globalThis.v2 = globalThis.jsA.aMethod('x');
    globalThis.v3 = globalThis.jsA.aGetter;
    globalThis.jsA.aSetter = false;

    globalThis.v4 = globalThis.jsA.cVariable;
    globalThis.v5 = globalThis.jsA.cMethod;
    globalThis.v6 = globalThis.jsA.cGetter;
    globalThis.v7 = globalThis.jsA.cSetter;
  ''');
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("aMethod(x);", (globalContext["v2"] as JSString).toDart);
  Expect.equals("aGetter", (globalContext["v3"] as JSString).toDart);
  Expect.equals("aSetter(false);", log);

  Expect.isNull(globalContext["v4"]);
  Expect.isNull(globalContext["v5"]);
  Expect.isNull(globalContext["v6"]);
  Expect.isNull(globalContext["v7"]);
}

main() {
  test(C1());
  test(C2());
}
