// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript `Symbol`
///
/// @description Check that each `JSSymbol` is a different object. Test an empty
/// name.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.s1 = Symbol();
    globalThis.s2 = Symbol();
  ''');
  JSSymbol s1 = globalContext["s1"] as JSSymbol;
  JSSymbol s2 = globalContext["s2"] as JSSymbol;
  JSSymbol s3 = globalContext["s1"] as JSSymbol;
  Expect.notEquals(s1, s2);
  Expect.equals(s1, s3);
}
