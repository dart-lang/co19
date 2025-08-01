// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
/// ...
/// Specifying name customizes the JavaScript name to use, which can be used in
/// the following scenarios:
/// - Adding a JavaScript prefix to all the external top-level declarations,
///   static members, and constructors of a library by parameterizing the
///   annotation on the library with `name`.
/// - Specifying the JavaScript class to use for external static members and
///   constructors of an interop extension type by parameterizing the annotation
///   on the interop extension type with `name`.
/// - Renaming external declarations by parameterizing the annotation on the
///   member with `name`.
///
/// @description Check that specifying `name` customizes the JavaScript `name`
/// to use. Test top-level declarations.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS("jsVar1")
external int var1;

@JS("jsVar2")
external final String var2;

@JS("jsGetter")
external int get getter;

@JS("jsF1")
external int f1();

@JS("jsF2")
external int f2(int v);

@JS("jsSetter")
external void set setter(int v);

main() {
  eval(r'''
    globalThis.jsVar1 = 42; 
    globalThis.jsVar2 = "var2 value";
    globalThis.jsGetter = -1;
    globalThis.jsF1 = function() {return 1;};
    globalThis.jsF2 = function(v) {return v;};
    globalThis.jsSetter = 0;
    
    globalThis.var1 = -42; 
    globalThis.var2 = "Wrong var2 value";
    globalThis.getter = -100;
    globalThis.f1 = function() {return 100;};
    globalThis.f2 = function(v) {return 100 + v;};
    globalThis.setter = 100;
  ''');
  Expect.equals(42, var1);
  Expect.equals("var2 value", var2);
  Expect.equals(-1, getter);
  Expect.equals(1, f1());
  Expect.equals(2, f2(2));
  setter = 3;
  Expect.equals(3, (globalContext["jsSetter"] as JSNumber).toDartInt);
  var1 = -1;
  eval("globalThis.jsVar1++");
  Expect.equals(0, var1);
}
