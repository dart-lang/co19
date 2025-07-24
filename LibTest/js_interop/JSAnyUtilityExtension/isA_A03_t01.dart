// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isA<T extends JSAny?>()
/// Whether this [JSAny?] is an instance of the JavaScript type that is declared
/// by `T`.
/// ...
/// If T is a non-primitive JS type like [JSArray] or an interop extension type
/// on one, this uses an instanceof check using the name or the `@JS` rename of
/// the given type like `instanceOfString('Array')`. Note that if you rename the
/// library using the `@JS` annotation, this uses the rename in the instanceof
/// check like `instanceOfString('library1.JSClass')`.
///
/// @description Checks that `isA<JSArray>` returns `true` for `JSArray` type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.ar1 = Array();
    globalThis.ar2 = [];
    globalThis.ar3 = [1, 2, 3];
  ''');
  test(globalContext["ar1"]);
  test(globalContext["ar2"]);
  test(globalContext["ar3"]);
}

test(JSAny? value) {
  Expect.isTrue(value.isA<JSArray>());
  Expect.isTrue(value.isA<JSAny>());
  Expect.isTrue(value.isA<JSObject>());
  Expect.isFalse(value.isA<JSNumber>());
  Expect.isFalse(value.isA<JSBoolean>());
  Expect.isFalse(value.isA<JSBigInt>());
  Expect.isFalse(value.isA<JSString>());
  Expect.isFalse(value.isA<JSSymbol>());
}
