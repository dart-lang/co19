// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Float64List get toDart
/// Converts this [JSFloat64Array] to a [Float64List] by either casting or
/// wrapping it.
///
/// When compiling to JavaScript, [Float64List]s are [JSFloat64Array]s and
/// this operation will be a cast. When compiling to Wasm, a wrapper is
/// introduced. Modifications to this [JSFloat64Array] will affect the
/// [Float64List] and vice versa.
///
/// @description Check that this getter converts this [JSFloat64Array] to a
/// [Float64List] and modifications to [JSFloat64Array] affect the [Float64List]
/// and vice versa. Test [JSFloat64Array] created in Dart.
/// @author sgrekhov22@gmail.com
/// @issue 61515

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  ByteBuffer buffer = Float64List.fromList([3.14]).buffer;
  JSFloat64Array a = JSFloat64Array(buffer.toJS);
  Float64List l = a.toDart;
  Expect.listApproxEquals([3.14], l.toList());

  a["0"] = (-3.14).toJS;
  Expect.listApproxEquals([-3.14], l.toList());

  l[0] = 1.1;
  Expect.listApproxEquals([1.1], a.toDart.toList());
}
