// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSExportedDartFunction get toJSCaptureThis
/// A callable JavaScript function that wraps this [Function] and captures the
/// `this` value when called.
///
/// Identical to `toJS`, except the resulting [JSExportedDartFunction] will pass
/// `this` from JavaScript as the first argument to the converted [Function].
/// Any [Function] that is converted with this member should take in an extra
/// parameter at the beginning of the parameter list to handle this.
///
/// @description Check that this property returns a JavaScript function that
/// wraps this Dart [Function]. Test constructors.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
extension type ET(JSNumber id) {
  ET.c1(pThis, this.id) {
    Expect.equals(globalContext, pThis);
  }

  @JS()
  ET.c2(Object pThis, JSNumber id): this(id);

  @JS()
  factory ET.c3(JSObject pThis, JSNumber id) = ET.c1;
}

main() {
  globalContext["jsC1"] = ET.c1.toJSCaptureThis;
  globalContext["jsC2"] = ET.c2.toJSCaptureThis;
  globalContext["jsC3"] = ET.c3.toJSCaptureThis;
  eval(r'''
    globalThis.v1 = globalThis.jsC1(1);
    globalThis.v2 = globalThis.jsC2(2);
    globalThis.v3 = globalThis.jsC3(3);
  ''');
  Expect.equals(1, (globalContext["v1"] as ET).id.toDartInt);
  Expect.equals(2, (globalContext["v2"] as ET).id.toDartInt);
  Expect.equals(3, (globalContext["v3"] as ET).id.toDartInt);
}
