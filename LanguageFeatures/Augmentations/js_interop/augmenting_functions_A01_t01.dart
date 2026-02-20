// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an external js interop function can be augmented.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

external int f1();

@JS()
augment int f1();

@JS()
external int f2(int v);

augment f2(v);

main() {
  eval(r'''
    globalThis.f1 = function() {return 1;};
    globalThis.f2 = function(v) {return v;};
  ''');
  Expect.equals(1, f1());
  Expect.equals(2, f2(2));
}
