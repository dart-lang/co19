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
/// Test [JSArray] created in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  JSArray<JSNumber> a = JSArray();
  List<JSNumber> l = a.toDart;
  Expect.listEquals([], l);

  a.add(1.toJS);
  Expect.listEquals([1.toJS], l);

  l.removeLast();
  Expect.listEquals([], a.toDart);
}
