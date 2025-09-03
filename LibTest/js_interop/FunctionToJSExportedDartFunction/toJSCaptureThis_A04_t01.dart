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
/// @description Check that this property returns a fresh object each time it is
/// invoked.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

int foo(pThis) => 42;

main() {
  Expect.notIdentical(foo.toJSCaptureThis, foo.toJSCaptureThis);
}
