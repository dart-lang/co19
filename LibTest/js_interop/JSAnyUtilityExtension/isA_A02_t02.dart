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
/// @description Checks that `isA` works as expected for JS `null` and
/// `undefined` values.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.n = null;
    globalThis.u = undefined;
  ''');
  Expect.isFalse(globalContext["n"].isA<JSString>());
  Expect.isFalse(globalContext["n"].isA<JSObject>());
  Expect.isFalse(globalContext["n"].isA<JSAny>());
  Expect.isFalse(globalContext["n"].isA<JSNumber>());
  Expect.isFalse(globalContext["n"].isA<JSBoolean>());
  Expect.isFalse(globalContext["n"].isA<JSSymbol>());
  Expect.isFalse(globalContext["n"].isA<JSBigInt>());
  Expect.isTrue(globalContext["n"].isA<JSAny?>());

  Expect.isFalse(globalContext["u"].isA<JSString>());
  Expect.isFalse(globalContext["u"].isA<JSObject>());
  Expect.isFalse(globalContext["u"].isA<JSAny>());
  Expect.isFalse(globalContext["u"].isA<JSNumber>());
  Expect.isFalse(globalContext["u"].isA<JSBoolean>());
  Expect.isFalse(globalContext["u"].isA<JSSymbol>());
  Expect.isFalse(globalContext["u"].isA<JSBigInt>());
  Expect.isTrue(globalContext["u"].isA<JSAny?>());
}
