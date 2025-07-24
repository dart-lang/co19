// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool typeofEquals( String typeString )
/// Whether the result of `typeof` on this `JSAny?` is `typeString`.
///
/// @description Checks that this method returns if the result of JS `typeof` on
/// this `JSAny?` is `typeString`. Test JS primitive types.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.s = ""; 
    globalThis.n1 = 42; 
    globalThis.n2 = 3.14;
    globalThis.b1 = true;
    globalThis.b2 = false;
    globalThis.bi = 42n;
    globalThis.smb = Symbol();
  ''');
  test(globalContext["s"], "string");
  test(globalContext["n1"], "number");
  test(globalContext["n2"], "number");
  test(globalContext["b1"], "boolean");
  test(globalContext["b2"], "boolean");
  test(globalContext["bi"], "bigint");
  test(globalContext["smb"], "symbol");
}

void test(JSAny? value, String expected) {
  Expect.isTrue(value.typeofEquals(expected));
  // To check that `typeofEquals` doesn't always return `true`
  Expect.isFalse(value.typeofEquals("object"));
}
