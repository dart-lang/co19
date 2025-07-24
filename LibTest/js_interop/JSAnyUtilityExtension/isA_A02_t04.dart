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
/// @description Checks that `isA` works as expected for `JSSymbol` type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.s = Symbol();
  ''');
  Expect.isTrue(globalContext["s"].isA<JSSymbol>());
  Expect.isTrue(globalContext["s"].isA<JSAny>());
  Expect.isFalse(globalContext["s"].isA<JSObject>());
  Expect.isFalse(globalContext["s"].isA<JSNumber>());
  Expect.isFalse(globalContext["s"].isA<JSBoolean>());
  Expect.isFalse(globalContext["s"].isA<JSBigInt>());
  Expect.isFalse(globalContext["s"].isA<JSString>());
}
