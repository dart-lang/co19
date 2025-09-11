// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion List<T> get toDart
/// Converts this [JSArray] to a [List] by either casting or wrapping it.
///
/// When compiling to JavaScript, [List]s are [JSArray]s and this will be a cast.
/// When compiling to Wasm, a wrapper is introduced. Modifications to this
/// [JSArray] will affect the [List] and vice versa. In order to ensure type
/// soundness, this method may introduce casts when accessing elements in order
/// to ensure they are of type `T`.
///
/// @description Check that this getter converts this [JSArray] to a [List].
/// Test [JSArray] created in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.a = [1, 2, 3];");
  JSArray<JSNumber> a = globalContext["a"] as JSArray<JSNumber>;
  List<JSNumber> l = a.toDart;
  Expect.listEquals([1.toJS, 2.toJS, 3.toJS], l);

  a.add(4.toJS);
  Expect.listEquals([1.toJS, 2.toJS, 3.toJS, 4.toJS], l);

  l.removeLast();
  Expect.listEquals([1.toJS, 2.toJS, 3.toJS], a.toDart);
}
