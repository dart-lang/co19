// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript callable function created from a Dart function.
///
/// @description Check that a native Dart function can be passed to JS and
/// called from JS.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
int foo(int v) => v;

@JS()
String bar() => "I'm foo from Dart";

main() {
  JSExportedDartFunction jsFoo = foo.toJS;
  JSExportedDartFunction jsBar= bar.toJS;
  globalContext["jsFoo"] = jsFoo;
  globalContext["jsBar"] = jsBar;

  eval(r'''
    globalThis.res1 = globalThis.jsFoo(42);
    globalThis.res2 = globalThis.jsBar();
  ''');

  jsExpectEquals(foo(42).toJS, globalContext["res1"]);
  jsExpectEquals(bar().toJS, globalContext["res2"]);
}
