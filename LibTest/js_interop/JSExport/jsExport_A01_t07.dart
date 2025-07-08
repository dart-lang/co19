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
/// @description Checks that when an extension type is annotated with
/// `@JSExport()` and passed to `createJSInteropWrapper`, the method returns a
/// JS object that contains a property for each of the representation type's
/// instance members.
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

@JSExport()
extension type ET(C c) implements C {
  String etMethod(String v) => "etMethod($v);";
  String get etGetter => "Some etGetter";
  void set etSetter(bool value) {
    log = "etSetter($value);";
  }
}

void main() {
  var jsET = createJSInteropWrapper<ET>(ET(C()));
  globalContext["jsET"] = jsET;
  eval(r'''
    globalThis.v1 = globalThis.jsET.variable;
    globalThis.v2 = globalThis.jsET.method('x');
    globalThis.v3 = globalThis.jsET.getter;
    globalThis.jsET.setter = false;

    globalThis.v4 = globalThis.jsET.c;
    globalThis.v5 = globalThis.jsET.etMethod;
    globalThis.v6 = globalThis.jsET.etGetter;
    globalThis.v7 = globalThis.jsET.etSetter;
  ''');
  Expect.equals(42, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("method(x);", (globalContext["v2"] as JSString).toDart);
  Expect.equals("Some getter", (globalContext["v3"] as JSString).toDart);
  Expect.equals("setter(false);", log);

  Expect.isNull(globalContext["v4"]);
  Expect.isNull(globalContext["v5"]);
  Expect.isNull(globalContext["v6"]);
  Expect.isNull(globalContext["v7"]);
}
