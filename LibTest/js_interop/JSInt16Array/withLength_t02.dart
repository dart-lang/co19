// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSInt16Array.withLength( int length )
/// Creates a JavaScript `Int16Array` of size `length` whose elements are
/// initialized to `0`.
///
/// @description Checks that this constructor throws if `length` is negative.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  Expect.throws(() {
    JSInt16Array.withLength(-1);
  });
}
