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
/// @description Checks that when an instance of an enum is annotated with
/// `@JSExport()` and passed to `createJSInteropWrapper`, the method returns a
/// JS object that contains a property for each of the enum's instance members.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

String log = "";

@JSExport()
enum E {
  e0(0);

  final int id;
  const E(this.id);

  String method(String v) => "method($v);";
  String get getter => "Some getter";
  void set setter(bool value) {
    log = "setter($value);";
  }
}

void main() {
  var jsE = createJSInteropWrapper<E>(E.e0);
  globalContext["jsE"] = jsE;
  eval(r'''
    globalThis.v1 = globalThis.jsE.id;
    globalThis.v2 = globalThis.jsE.method('x');
    globalThis.v3 = globalThis.jsE.getter;
    globalThis.jsE.setter = false;
  ''');
  Expect.equals(0, (globalContext["v1"] as JSNumber).toDartInt);
  Expect.equals("method(x);", (globalContext["v2"] as JSString).toDart);
  Expect.equals("Some getter", (globalContext["v3"] as JSString).toDart);
  Expect.equals("setter(false);", log);
}
