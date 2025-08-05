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
/// @description Checks that `isA` works as expected for JS nullable primitive
/// types.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.s = "JS string";
    globalThis.b = false;
    globalThis.n1 = 42;
    globalThis.n2 = 3.14;
    globalThis.bi = 123456789n;
    globalThis.smb = Symbol();
    globalThis.n = null;
  ''');
  Expect.isTrue(globalContext["s"].isA<JSString?>());
  Expect.isTrue(globalContext["s"].isA<JSAny?>());
  Expect.isFalse(globalContext["s"].isA<JSObject?>());
  Expect.isFalse(globalContext["s"].isA<JSNumber?>());
  Expect.isFalse(globalContext["s"].isA<JSBoolean?>());
  Expect.isFalse(globalContext["s"].isA<JSSymbol?>());
  Expect.isFalse(globalContext["s"].isA<JSBigInt?>());

  Expect.isTrue(globalContext["b"].isA<JSBoolean?>());
  Expect.isTrue(globalContext["b"].isA<JSAny?>());
  Expect.isFalse(globalContext["b"].isA<JSObject?>());
  Expect.isFalse(globalContext["b"].isA<JSNumber?>());
  Expect.isFalse(globalContext["b"].isA<JSString?>());
  Expect.isFalse(globalContext["b"].isA<JSSymbol?>());
  Expect.isFalse(globalContext["b"].isA<JSBigInt?>());

  Expect.isTrue(globalContext["n1"].isA<JSNumber?>());
  Expect.isTrue(globalContext["n1"].isA<JSAny?>());
  Expect.isFalse(globalContext["n1"].isA<JSObject?>());
  Expect.isFalse(globalContext["n1"].isA<JSBoolean?>());
  Expect.isFalse(globalContext["n1"].isA<JSString?>());
  Expect.isFalse(globalContext["n1"].isA<JSSymbol?>());
  Expect.isFalse(globalContext["n1"].isA<JSBigInt?>());

  Expect.isTrue(globalContext["n2"].isA<JSNumber?>());
  Expect.isTrue(globalContext["n2"].isA<JSAny?>());
  Expect.isFalse(globalContext["n2"].isA<JSObject?>());
  Expect.isFalse(globalContext["n2"].isA<JSBoolean?>());
  Expect.isFalse(globalContext["n2"].isA<JSString?>());
  Expect.isFalse(globalContext["n2"].isA<JSSymbol?>());
  Expect.isFalse(globalContext["n2"].isA<JSBigInt?>());

  Expect.isTrue(globalContext["bi"].isA<JSBigInt?>());
  Expect.isTrue(globalContext["bi"].isA<JSAny?>());
  Expect.isFalse(globalContext["bi"].isA<JSObject?>());
  Expect.isFalse(globalContext["bi"].isA<JSNumber?>());
  Expect.isFalse(globalContext["bi"].isA<JSBoolean?>());
  Expect.isFalse(globalContext["bi"].isA<JSSymbol?>());
  Expect.isFalse(globalContext["bi"].isA<JSString?>());

  Expect.isTrue(globalContext["smb"].isA<JSSymbol?>());
  Expect.isTrue(globalContext["smb"].isA<JSAny?>());
  Expect.isFalse(globalContext["smb"].isA<JSObject?>());
  Expect.isFalse(globalContext["smb"].isA<JSNumber?>());
  Expect.isFalse(globalContext["smb"].isA<JSBoolean?>());
  Expect.isFalse(globalContext["smb"].isA<JSBigInt?>());
  Expect.isFalse(globalContext["smb"].isA<JSString?>());

  Expect.isTrue(globalContext["n"].isA<JSSymbol?>());
  Expect.isTrue(globalContext["n"].isA<JSAny?>());
  Expect.isTrue(globalContext["n"].isA<JSObject?>());
  Expect.isTrue(globalContext["n"].isA<JSNumber?>());
  Expect.isTrue(globalContext["n"].isA<JSBoolean?>());
  Expect.isTrue(globalContext["n"].isA<JSBigInt?>());
  Expect.isTrue(globalContext["n"].isA<JSString?>());

  Expect.isTrue(globalContext["u"].isA<JSSymbol?>());
  Expect.isTrue(globalContext["u"].isA<JSAny?>());
  Expect.isTrue(globalContext["u"].isA<JSObject?>());
  Expect.isTrue(globalContext["u"].isA<JSNumber?>());
  Expect.isTrue(globalContext["u"].isA<JSBoolean?>());
  Expect.isTrue(globalContext["u"].isA<JSBigInt?>());
  Expect.isTrue(globalContext["u"].isA<JSString?>());
}
