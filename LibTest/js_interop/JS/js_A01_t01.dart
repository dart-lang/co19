// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that `@JS()` annotation defines a top-level external
/// declaration as a JavaScript interop declaration.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
external int var1;

@JS()
external final String var2;

@JS()
external int get getter;

@JS()
external int f1();

@JS()
external int f2(int v);

@JS()
external void set setter(int v);

main() {
  eval(r'''
    globalThis.var1 = 42; 
    globalThis.var2 = "var2 value";
    globalThis.getter = -1;
    globalThis.f1 = function() {return 1;};
    globalThis.f2 = function(v) {return v;};
    globalThis.setter = 0;
  ''');
  Expect.equals(42, var1);
  Expect.equals("var2 value", var2);
  Expect.equals(-1, getter);
  Expect.equals(1, f1());
  Expect.equals(2, f2(2));
  setter = 3;
  Expect.equals(3, (globalContext["setter"] as JSNumber).toDartInt);
  var1 = -1;
  eval("globalThis.var1++");
  Expect.equals(0, var1);
}
