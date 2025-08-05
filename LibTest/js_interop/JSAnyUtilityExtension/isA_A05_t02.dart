// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isA<T extends JSAny?>()
/// Whether this [JSAny?] is an instance of the JavaScript type that is declared
/// by `T`.
/// ...
/// To determine the JavaScript constructor to use as the second operand in the
/// `instanceof` check, this function uses the JavaScript name associated with
/// the extension type, which is either the argument given to the @JS annotation
/// or the Dart declaration name. So, if you had an interop extension type
/// `JSClass` that wraps [JSArray] without a rename, this does an
/// `instanceOfString('JSClass')` check and not an `instanceOfString('Array')`
/// check.
///
/// There are two exceptions to this rule. The first exception is [JSTypedArray].
/// As `TypedArray` does not exist as a property in JavaScript, this does some
/// prototype checking to make `isA<JSTypedArray>` do the right thing. The other
/// exception is [JSAny]. If you do a `isA<JSAny>` check, it will only do a
/// `null` check.
///
/// @description Checks that `isA<JSAny>` returns `true` for any non-null value.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.i = 1;
    globalThis.f = 3.14;
    globalThis.s = "JS String";
    globalThis.b = true;
    globalThis.bi = 42n;
    globalThis.sm = Symbol();
    globalThis.n = null;
    globalThis.u = undefined;
    ''');
  Expect.isTrue(JSObject().isA<JSAny>());
  Expect.isTrue(globalContext["i"].isA<JSAny>());
  Expect.isTrue(globalContext["f"].isA<JSAny>());
  Expect.isTrue(globalContext["s"].isA<JSAny>());
  Expect.isTrue(globalContext["b"].isA<JSAny>());
  Expect.isTrue(globalContext["bi"].isA<JSAny>());
  Expect.isTrue(globalContext["sm"].isA<JSAny>());
  Expect.isFalse(globalContext["n"].isA<JSAny>());
  Expect.isFalse(globalContext["u"].isA<JSAny>());
}
