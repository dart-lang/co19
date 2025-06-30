// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript `Function` value.
///
/// @description Check that `JSFunction` can store a JavaScript `Function` value
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
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
  eval("globalThis.fooEquals = foo2 === foo;");
  Expect.isTrue((globalContext["fooEquals"] as JSBoolean).toDart);

  JSFunction bar = globalContext["bar"] as JSFunction;
  globalContext["bar2"] = bar;
  eval("globalThis.barEquals = bar2 === bar;");
  Expect.isTrue((globalContext["barEquals"] as JSBoolean).toDart);

  JSFunction baz = globalContext["baz"] as JSFunction;
  globalContext["baz2"] = baz;
  eval("globalThis.bazEquals = baz2 === baz;");
  Expect.isTrue((globalContext["bazEquals"] as JSBoolean).toDart);
}
