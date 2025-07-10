// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Classes and mixins in the hierarchy of the annotated class are
/// included only if they are annotated as well or specific members in them are
/// annotated. If a superclass does not have an annotation anywhere, its members
/// are not included.
///
/// @description Checks that if members of a superclass are annotated with
/// `@JSExport` then those members are included in the corresponding JS object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

class A {
  @JSExport()
  int aVariable = 42;
  @JSExport()
  String aMethod(String v) => "aMethod($v);";
  @JSExport()
  String get aGetter => "aGetter";
  @JSExport()
  void set aSetter(bool value) {
    log = "aSetter($value);";
  }
}

@JSExport()
class C extends A {
}

void main() {
  var jsC = createJSInteropWrapper<C>(C());
  globalContext["jsC"] = jsC;
  eval(r'''
    globalThis.v1 = globalThis.jsC.aVariable;
    globalThis.v2 = globalThis.jsC.aMethod('x');
    globalThis.v3 = globalThis.jsC.aGetter;
    globalThis.jsC.aSetter = false;
  ''');
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("aMethod(x);", (globalContext["v2"] as JSString).toDart);
  Expect.equals("aGetter", (globalContext["v3"] as JSString).toDart);
  Expect.equals("aSetter(false);", log);
}
