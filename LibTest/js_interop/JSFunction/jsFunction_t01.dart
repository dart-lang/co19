// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript `Function` value.
///
/// @description Check that `JSNumber` can store Dart `int` and `float` values.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {
      return 42;
    }
    globalThis.bar = function (v) {
      return v;
    }
    globalThis.baz = function() {}
  ''');

  JSFunction foo = globalContext["foo"] as JSFunction;
  globalContext["foo2"] = foo;
  eval("globalThis.foo2Res = foo2();");
  jsExpectEquals(42.toJS, globalContext["foo2Res"]);

  JSFunction bar = globalContext["bar"] as JSFunction;
  globalContext["bar2"] = bar;
  eval("globalThis.bar2Res = bar2('Lily was here');");
  jsExpectEquals('Lily was here'.toJS, globalContext["bar2Res"]);

  JSFunction baz = globalContext["baz"] as JSFunction;
  globalContext["baz2"] = bar;
  eval("globalThis.baz2Res = baz2();");
  jsExpectEquals(null, globalContext["baz2Res"]);
}
