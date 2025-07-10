// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Classes and mixins in the hierarchy of the annotated class are
/// included only if they are annotated as well or specific members in them are
/// annotated. If a superclass does not have an annotation anywhere, its members
/// are not included.
///
/// @description Checks that if a mixin members are annotated with `@JSExport`
/// then those members are included in the corresponding JS object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

mixin M {
  @JSExport()
  int annotatedVariable = 42;
  @JSExport()
  String annotatedMethod(String v) => "annotatedMethod($v);";
  @JSExport()
  String get annotatedGetter => "annotatedGetter";
  @JSExport()
  void set annotatedSetter(bool value) {
    log = "annotatedSetter($value);";
  }

  int mVariable = 42;
  String mMethod(String v) => "mMethod($v);";
  String get mGetter => "mGetter";
  void set mSetter(bool value) {
    log = "mSetter($value);";
  }
}

@JSExport()
class C with M {}

void main() {
  var jsM = createJSInteropWrapper<C>(C());
  globalContext["jsM"] = jsM;
  eval(r'''
    globalThis.v1 = globalThis.jsM.annotatedVariable;
    globalThis.v2 = globalThis.jsM.annotatedMethod('x');
    globalThis.v3 = globalThis.jsM.annotatedGetter;
    globalThis.jsM.annotatedSetter = false;
    
    globalThis.v4 = globalThis.jsM.mVariable;
    globalThis.v5 = globalThis.jsM.mMethod;
    globalThis.v6 = globalThis.jsM.mGetter;
  ''');
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("annotatedMethod(x);", (globalContext["v2"] as JSString).toDart);
  Expect.equals("annotatedGetter", (globalContext["v3"] as JSString).toDart);
  Expect.equals("annotatedSetter(false);", log);

  log = "";
  eval("globalThis.jsM.mSetter = false;");
  Expect.isNull(globalContext["v4"] );
  Expect.isNull(globalContext["v5"] );
  Expect.isNull(globalContext["v6"] );
  Expect.equals("", log);
}
