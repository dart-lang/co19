// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If members are overridden, only the overriding member will be
/// wrapped as long as it or its class has this annotation.
///
/// @description Checks that if members are overridden, but overriding  members
/// are not annotated with `JSExport()` then the original members are not
/// wrapped. Test a mixin.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

@JSExport()
mixin M {
  int variable = 0;
  String method(String v) => "method($v);";
  String get getter => "getter";
  void set setter(bool value) {
    log = "setter($value);";
  }
}

class C with M {
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

  @JSExport()
  String s = "Dummy member to allow C to be passed to createJSInteropWrapper";
}

void main() {
  var jsC = createJSInteropWrapper<C>(C());
  globalContext["jsC"] = jsC;
  eval(r'''
    globalThis.v1 = globalThis.jsC.variable;
    globalThis.v2 = globalThis.jsC.method;
    globalThis.v3 = globalThis.jsC.getter;
    globalThis.jsC.setter = false;
  ''');
  Expect.isNull(globalContext["v1"]);
  Expect.isNull(globalContext["v2"]);
  Expect.isNull(globalContext["v3"]);
  Expect.equals("", log);

  var jsM = createJSInteropWrapper<M>(C());
  globalContext["jsM"] = jsM;
  eval(r'''
    globalThis.v4 = globalThis.jsM.variable;
    globalThis.v5 = globalThis.jsM.method('x');
    globalThis.v6 = globalThis.jsM.getter;
    globalThis.jsM.setter = false;
  ''');
  Expect.equals(42, (globalContext["v4"] as JSNumber).toDartInt);
  Expect.equals(
    "Overridden method(x);",
    (globalContext["v5"] as JSString).toDart,
  );
  Expect.equals("Overridden getter", (globalContext["v6"] as JSString).toDart);
  Expect.equals("Overridden setter(false);", log);
}
