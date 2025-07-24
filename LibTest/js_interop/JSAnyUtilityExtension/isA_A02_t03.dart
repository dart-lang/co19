// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isA<T extends JSAny?>()
/// Whether this [JSAny?] is an instance of the JavaScript type that is declared
/// by `T`.
/// ...
/// If `T` is a primitive JS type like [JSString], this uses a `typeof` check
/// that corresponds to that primitive type like `typeofEquals('string')`.
///
/// @description Checks that `isA` works as expected for `JSBigInt` type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.bi1 = 42n;
    globalThis.bi2 = 123456789n;
  ''');
  Expect.isTrue(globalContext["bi1"].isA<JSBigInt>());
  Expect.isTrue(globalContext["bi1"].isA<JSAny>());
  Expect.isFalse(globalContext["bi1"].isA<JSObject>());
  Expect.isFalse(globalContext["bi1"].isA<JSNumber>());
  Expect.isFalse(globalContext["bi1"].isA<JSBoolean>());
  Expect.isFalse(globalContext["bi1"].isA<JSSymbol>());
  Expect.isFalse(globalContext["bi1"].isA<JSString>());

  Expect.isTrue(globalContext["bi2"].isA<JSBigInt>());
  Expect.isTrue(globalContext["bi2"].isA<JSAny>());
  Expect.isFalse(globalContext["bi2"].isA<JSObject>());
  Expect.isFalse(globalContext["bi2"].isA<JSNumber>());
  Expect.isFalse(globalContext["bi2"].isA<JSBoolean>());
  Expect.isFalse(globalContext["bi2"].isA<JSSymbol>());
  Expect.isFalse(globalContext["bi2"].isA<JSString>());
}
