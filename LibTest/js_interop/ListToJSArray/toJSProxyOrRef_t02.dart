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
/// Test an array instantiated in JS.
/// @author sgrekhov22@gmail.com
/// @issue 61327

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.a = [1, 2, 3];");
  List<JSNumber> l = (globalContext["a"] as JSArray<JSNumber>).toDart;
  JSArray<JSNumber> a = l.toJSProxyOrRef;
  Expect.listEquals(l, a.toDart);

  l.add(4.toJS);
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l, a.toDart);
  }
  if (isWasm) {
    // The `List` was instantiated in JS. This is a wrapping case. Unwrapping
    // should return the same array but not the same object.
    Expect.listEquals([1.toJS, 2.toJS, 3.toJS, 4.toJS], a.toDart);
    Expect.notIdentical(l, a.toDart);
  }
}
