// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool typeofEquals( String typeString )
/// Whether the result of `typeof` on this `JSAny?` is `typeString`.
///
/// @description Checks that this method returns if the result of JS `typeof` on
/// this `JSAny?` is `typeString`. Test `null` and `undefined`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.n = null;");
  if (isWasm) {
    test(globalContext["undefined"], "object");
  } else {
    test(globalContext["undefined"], "undefined");
  }
  test(globalContext["n"], "object");
}

void test(JSAny? value, String expected) {
  Expect.isTrue(value.typeofEquals(expected));
  // To check that `typeofEquals` doesn't always return `true`
  Expect.isFalse(value.typeofEquals("function"));
}
