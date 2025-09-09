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
/// wraps this [Function] and captures the `this` value when called. Check that
/// a [JSString] can be passes as a value of `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';

extension type JSStringOrJSStringObject._(JSAny _) implements JSAny {
  @JS('toString')
  external String toStringJS();
}

void foo(Object pThis) {
  Expect.equals("Value of this", pThis.toString());
}

main() {
  globalContext["jsFoo"] = foo.toJSCaptureThis;
  JSFunction jsFoo = globalContext["jsFoo"] as JSFunction;
  jsFoo.callAsFunction("Value of this".toJS);
}
