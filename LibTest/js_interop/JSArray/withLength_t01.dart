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
  JSArray<JSString> a0 = JSArray<JSString>.withLength(0);
  Expect.equals(0, a0.length);
  globalContext["a0"] = a0;
  eval(r'''
    globalThis.b0 = a0.length === 0;
    ''');
  Expect.isTrue((globalContext["b0"] as JSBoolean).toDart);

  JSArray<JSString> a1 = JSArray<JSString>.withLength(1);
  Expect.equals(1, a1.length);
  globalContext["a1"] = a1;
  eval(r'''
    globalThis.b1 = a1.length === 1;
    globalThis.v1 = a1[0];
    ''');
  Expect.isTrue((globalContext["b1"] as JSBoolean).toDart);
  Expect.isNull(globalContext["v1"]);
}
