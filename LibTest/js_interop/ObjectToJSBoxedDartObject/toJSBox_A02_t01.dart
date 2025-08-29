// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript object that wraps this [Object].
///
/// There are no usable members in the resulting [JSBoxedDartObject] and you may
/// get a new [JSBoxedDartObject] when calling [toJSBox] on the same Dart
/// [Object].
///
/// Throws an [Exception] if this [Object] is a JavaScript value.
///
/// Unlike [ObjectToExternalDartReference.toExternalReference], this returns a
/// JavaScript value. Therefore, the representation is guaranteed to be
/// consistent across all platforms and interop members can be declared on
/// [JSBoxedDartObjects].
///
/// @description Checks that an [Exception] is thrown if this [Object] is a
/// JavaScript value. Test JS primitive types.
/// @author sgrekhov22@gmail.com
/// @issue 61405, 56905

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.bi = 42n;
    globalThis.s = Symbol("name");
  ''');
  Expect.throws(() {
    "String".toJS.toJSBox;
  });

  Expect.throws(() {
    42.toJS.toJSBox;
  });
  Expect.throws(() {
    true.toJS.toJSBox;
  });
  Expect.throws(() {
    (globalContext["bi"] as JSBigInt).toJSBox;
  });
  Expect.throws(() {
    (globalContext["s"] as JSSymbol).toJSBox;
  });
}
