// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript string
///
/// @description Check that `JSString` can store Dart strings.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(String s) {
  eval("globalThis.s = '$s';");
  Expect.equals(s, (globalContext["s"] as JSString).toDart);
}

main() {
  test("");
  test("Some string");
}
