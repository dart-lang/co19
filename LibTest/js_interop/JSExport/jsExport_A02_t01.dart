// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion You can either annotate specific instance members to only wrap
/// those members or you can annotate the entire class, which will include all
/// of its instance members.
///
/// @description Checks that if a specific instance members are annotated with
/// `@JSExport()` and then the object is passed to `createJSInteropWrapper`,
/// then the method returns a JS object that contains a property for that
/// instance members only.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

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
    globalThis.v5 = globalThis.jsC.method;
    globalThis.v6 = globalThis.jsC.getter;
    globalThis.v7 = globalThis.jsC.setter;
  ''');
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("annotatedMethod(x);", (globalContext["v2"] as JSString).toDart);
  Expect.equals("Some annotatedGetter", (globalContext["v3"] as JSString).toDart);
  Expect.equals("annotatedSetter(false);", log);

  Expect.isNull(globalContext["v4"]);
  Expect.isNull(globalContext["v5"]);
  Expect.isNull(globalContext["v6"]);
  Expect.isNull(globalContext["v7"]);
}
