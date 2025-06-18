// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript `DataView`.
///
/// @description Check that `JSDataView` can store JavaScript `DataView` values.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.buffer = new ArrayBuffer(2);
    globalThis.view1 = new DataView(buffer);
  ''');
  JSDataView dw = globalContext["view1"] as JSDataView;

  globalContext["view2"] = dw;
  eval(r'''
    globalThis.view2.setInt16(0, 42, true);
    globalThis.check = new Int16Array(globalThis.buffer)[0];
  ''');
  Expect.equals(42, (globalContext["check"] as JSNumber).toDartInt);
}
