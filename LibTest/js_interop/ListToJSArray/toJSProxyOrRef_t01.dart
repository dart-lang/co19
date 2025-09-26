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
///
/// When compiling to JavaScript, the core [List] is a JavaScript `Array`, and
/// therefore this getter simply casts. If the [List] is not a core [List]
/// e.g. a user-defined list, this getter throws with a cast error.
///
/// When compiling to Wasm, this [List] is a wrapper around an `Array` if it
/// was converted via [JSArrayToList.toDart]. If it's a wrapper, this getter
/// unwraps it and returns the `Array`. If it's instantiated in Dart, this
/// getter proxies the [List] using a heavyweight `Array` wrapper. Access to
/// the original [List]'s elements may be very unperformant.
///
/// Modifications to this [List] will affect the returned [JSArray] and vice
/// versa.
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
