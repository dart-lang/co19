// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSExportedDartFunction get toJS
/// ...
/// Calling this on the same [Function] again will always result in a new
/// JavaScript function.
///
/// @description Check that this property always return a new object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

int foo() => 42;

main() {
  Expect.notIdentical(foo.toJS, foo.toJS);
}
