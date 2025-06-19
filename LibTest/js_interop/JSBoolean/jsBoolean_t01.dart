// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript boolean.
///
/// @description Check that `JSBoolean` can store JavaScript boolean values.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.b1 = true;");
  eval("globalThis.b2 = false;");

  JSBoolean b1 = globalContext["b1"] as JSBoolean;
  JSBoolean b2 = globalContext["b2"] as JSBoolean;
  Expect.isTrue(b1.toDart);
  Expect.isFalse(b2.toDart);
}
