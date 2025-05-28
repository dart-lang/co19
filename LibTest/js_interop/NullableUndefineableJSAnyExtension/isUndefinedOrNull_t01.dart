// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool get isUndefinedOrNull
///
/// @description Checks that this getter returns `true` if the value
/// corresponds to JavaScript `undefined` or `null`. `false` otherwise.
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

  Expect.isTrue(globalContext["n"].isUndefinedOrNull);
  Expect.isFalse(42.toJS.isUndefinedOrNull);
  Expect.isTrue(globalContext["u"].isUndefinedOrNull);
  Expect.isFalse(globalContext["s"].isUndefinedOrNull);
  Expect.isTrue(null.isUndefinedOrNull);
}
