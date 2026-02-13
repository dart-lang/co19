// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an abstract function can be augmented by an
/// external js interop function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

int f1();

@JS('foo')
augment external int f1();

@JS('bar')
int f2(int v);

augment external f2(v);

main() {
  eval(r'''
    globalThis.foo = function() {return 1;};
    globalThis.bar = function(v) {return v;};
  ''');
  Expect.equals(1, f1());
  Expect.equals(2, f2(2));
}
