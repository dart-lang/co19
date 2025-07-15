// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If members are overridden, only the overriding member will be
/// wrapped as long as it or its class has this annotation.
///
/// @description Checks that if members are overridden, only the overriding
/// members are wrapped. Test that invocation of wrapping JS object member
/// invokes corresponding overridden member of the Dart object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

@JSExport()
class A {
  int variable = 0;
  String method(String v) => "method($v);";
  String get getter => "getter";
  void set setter(bool value) {
    log = "setter($value);";
  }
}

@JSExport()
class C extends A {
  @override
  int variable = 42;

  @override
  String method(String v) => "Overridden method($v);";

  @override
  String get getter => "Overridden getter";

  @override
  void set setter(bool value) {
    log = "Overridden setter($value);";
  }
}

void main() {
  doTest(createJSInteropWrapper<C>(C()));
  doTest(createJSInteropWrapper<A>(C()));
}

void doTest(JSObject jsC) {
  globalContext["jsC"] = jsC;
  eval(r'''
    globalThis.v1 = globalThis.jsC.variable;
    globalThis.v2 = globalThis.jsC.method('x');
    globalThis.v3 = globalThis.jsC.getter;
    globalThis.jsC.setter = false;
  ''');
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals(
    "Overridden method(x);",
    (globalContext["v2"] as JSString).toDart,
  );
  Expect.equals("Overridden getter", (globalContext["v3"] as JSString).toDart);
  Expect.equals("Overridden setter(false);", log);
}
