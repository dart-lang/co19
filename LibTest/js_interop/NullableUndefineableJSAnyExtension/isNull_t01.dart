// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool get isNull
/// Whether this value corresponds to JavaScript `null`.
///
/// @description Checks if this value corresponds to JavaScript `null`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    var n = null;
    var u = undefined;
    var s = "s";
  ''');

  Expect.isTrue(globalContext["n"].isNull);
  Expect.isFalse(42.toJS.isNull);
  Expect.isFalse(globalContext["u"].isNull);
  Expect.isFalse(globalContext["s"].isNull);
  Expect.isTrue(null.isNull);
}
