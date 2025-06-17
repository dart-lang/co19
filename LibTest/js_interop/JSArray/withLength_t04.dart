// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArray<T extends JSAny?>.withLength( int length )
/// Creates a JavaScript `Array` of size `length` with no elements.
///
/// @description Checks that this constructor creates a JavaScript `Array` of
/// size `length` with no elements.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  const maxArrayLength = 4294967295; // 2^32 - 1
  JSArray<JSString> a0 = JSArray<JSString>.withLength(maxArrayLength);
  Expect.equals(maxArrayLength, a0.length);
  globalContext["a0"] = a0;
  eval(r'''
    var b0 = a0.length === 4294967295;
    ''');
  Expect.isTrue((globalContext["b0"] as JSBoolean).toDart);
}
