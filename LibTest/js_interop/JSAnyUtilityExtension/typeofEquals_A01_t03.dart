// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool typeofEquals( String typeString )
/// Whether the result of `typeof` on this `JSAny?` is `typeString`.
///
/// @description Checks that this method returns `true` if the result of JS
/// `typeof` on this `JSAny?` is `typeString`, and `false` otherwise. Test
/// `function`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {}
    globalThis.f1 = foo;
    globalThis.f2 = function (x) {};
    globalThis.f3 = (x, y) => x + y;
    
  ''');
  test(globalContext["f1"]);
  test(globalContext["f2"]);
  test(globalContext["f3"]);
}

void test(JSAny? value) {
  Expect.isTrue(value.typeofEquals("function"));
  // Check that `typeofEquals` doesn't always return `true`
  Expect.isFalse(value.typeofEquals("object"));
}
