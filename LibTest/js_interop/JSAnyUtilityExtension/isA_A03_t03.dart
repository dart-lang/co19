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
/// @description Checks that `isA<JSArray>` returns `true` for an extension type
/// on `JSArray`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
extension type MyArray1(JSArray ar) implements JSArray {}

@JS()
extension type MyArray2<T extends JSAny?>(JSArray<T> ar) implements JSArray<T> {
}

main() {
  MyArray1 ma1 = MyArray1(JSArray());
  globalContext["ma1"] = ma1;
  Expect.isTrue(globalContext["ma1"].isA<JSArray>());
  Expect.isFalse(globalContext["ma1"].isA<JSNumber>());
  Expect.isFalse(globalContext["ma1"].isA<MyArray1>());

  eval("globalThis.s = 'JS String';");
  JSString jsS = globalContext["s"] as JSString;
  JSArray<JSString> jsArr = JSArray<JSString>.withLength(1);
  jsArr[0] = jsS;
  MyArray2<JSString> ma2 = MyArray2(jsArr);
  globalContext["ma2"] = ma2;
  Expect.isTrue(globalContext["ma2"].isA<JSArray<JSString>>());
  Expect.isTrue(globalContext["ma2"].isA<JSArray<JSNumber>>());
  Expect.isFalse(globalContext["ma2"].isA<MyArray2>());
}
