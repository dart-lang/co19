// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArray<T> get toJSProxyOrRef
/// Converts this [List] to a [JSArray] by either casting, unwrapping, or
/// proxying the [List].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
/// > When compiling to JavaScript, the core [List] is a JavaScript `Array`,
/// > and therefore this method simply casts. User-defined [List]s are
/// > currently unsupported when compiling to JavaScript.
/// > When compiling to Wasm, this [List] may or may not be a wrapper
/// > depending on if it was converted from JavaScript or instantiated in
/// > Dart. If it's a wrapper, this method unwraps it. If it's instantiated in
/// > Dart, this method proxies the [List] using a heavyweight `Array`
/// > wrapper. Access to the original [List]'s elements may be very
/// > unperformant.
/// > Modifications to this [List] will affect the [JSArray] and vice versa.
///
/// @description Check that this method converts this [List] to a [JSArray].
/// Test an array instantiated in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  List<JSString> l1 = List<JSString>.empty();
  JSArray<JSString> a1 = l1.toJSProxyOrRef;
  Expect.equals(0, a1.length);
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l1, a1.toDart);
  }
  if (isWasm) {
    // The `List` was instantiated in Dart. This is a case of proxy.
    Expect.notIdentical(l1, a1.toDart);
  }

  List<JSNumber> l2 = [1.toJS, 2.toJS, 3.toJS];
  JSArray<JSNumber> a2 = l2.toJSProxyOrRef;
  Expect.listEquals(l2, a2.toDart);
  if (isJS) {
    Expect.identical(l1, a1.toDart);
  }
  if (isWasm) {
    Expect.notIdentical(l1, a1.toDart);
  }
  l2.add(4.toJS);
  Expect.listEquals(l2, a2.toDart);
}
