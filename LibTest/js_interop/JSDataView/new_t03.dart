// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSDataView(JSArrayBuffer buffer, [int byteOffset, int byteLength])
/// Creates a JavaScript `DataView` with `buffer` as its backing storage, offset
/// by `byteOffset` bytes, of size `byteLength`.
///
/// @description Check that this constructor Creates a JavaScript `DataView`
/// with `buffer` as its backing storage, offset by `byteOffset` bytes, of size
/// `byteLength`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  JSArrayBuffer buffer1 = JSArrayBuffer(4);
  globalContext["buffer1"] = buffer1;
  JSDataView dw1 = JSDataView(buffer1, 1, 2);
  globalContext["dw1"] = dw1;
  eval(r'''
  globalThis.dw1.setInt16(0, 255, true);
  globalThis.buffer2 = new ArrayBuffer(4);
  globalThis.dw2 = new DataView(buffer2, 1, 2).setInt16(0, 255, true);
  globalThis.check1 = new Int16Array(buffer2)[0] == new Int16Array(buffer1)[0];
  
  globalThis.buffer3 = new ArrayBuffer(4);
  globalThis.dw3 = new DataView(buffer3, 2).setInt16(0, 255, true);
  globalThis.check2 = new Int16Array(buffer3)[0] == new Int16Array(buffer1)[0];
  ''');
  Expect.isTrue((globalContext["check1"] as JSBoolean).toDart);
  Expect.isFalse((globalContext["check2"] as JSBoolean).toDart);
}
