// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSDataView(JSArrayBuffer buffer, [int byteOffset, int byteLength])
/// Creates a JavaScript `DataView` with `buffer` as its backing storage, offset
/// by `byteOffset` bytes, of size `byteLength`.
///
/// @description Check that this constructor Creates a JavaScript `DataView`
/// with `buffer` as its backing storage.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  JSArrayBuffer buffer = JSArrayBuffer(2);
  JSInt16Array val1 = JSInt16Array(buffer);
  Expect.equals(0, val1.toDart[0]);
  JSDataView dw = JSDataView(buffer);
  globalContext["dw"] = dw;
  eval(r'''
    globalThis.dw.setInt16(0, 42, true);
  ''');
  JSDataView dw2 = globalContext["dw"] as JSDataView;
  JSInt16Array val2 = JSInt16Array(buffer);
  Expect.equals(42, val2.toDart[0]);
}
