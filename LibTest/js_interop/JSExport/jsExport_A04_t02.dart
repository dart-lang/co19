// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Classes and mixins in the hierarchy of the annotated class are
/// included only if they are annotated as well or specific members in them are
/// annotated. If a superclass does not have an annotation anywhere, its members
/// are not included.
///
/// @description Checks that if a mixin application class is not annotated with
/// `@JSExport` but the mixin is annotated then the mixin members are included
/// in the corresponding JS object but the class's members aren't.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

@JSExport()
mixin M {
  int mVariable = 42;
  String mMethod(String v) => "mMethod($v);";
  String get mGetter => "mGetter";
  void set mSetter(bool value) {
    log = "mSetter($value);";
  }
}

class C with M {
  int cVariable = 0;
  String cMethod(String v) => "cMethod($v);";
  String get cGetter => "cGetter";
  void set cSetter(bool value) {
    log = "cSetter($value);";
  }
}

void main() {
  var m = C();
  var jsM = createJSInteropWrapper<M>(m);
  globalContext["jsM"] = jsM;
  eval(r'''
    globalThis.v1 = globalThis.jsM.mVariable;
    globalThis.v2 = globalThis.jsM.mMethod('x');
    globalThis.v3 = globalThis.jsM.mGetter;
    globalThis.jsM.mSetter = false;

    globalThis.v4 = globalThis.jsM.cVariable;
    globalThis.v5 = globalThis.jsM.cMethod;
    globalThis.v6 = globalThis.jsM.cGetter;
    globalThis.v7 = globalThis.jsM.cSetter;
  ''');
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("mMethod(x);", (globalContext["v2"] as JSString).toDart);
  Expect.equals("mGetter", (globalContext["v3"] as JSString).toDart);
  Expect.equals("mSetter(false);", log);

  Expect.isNull(globalContext["v4"]);
  Expect.isNull(globalContext["v5"]);
  Expect.isNull(globalContext["v6"]);
  Expect.isNull(globalContext["v7"]);
}
