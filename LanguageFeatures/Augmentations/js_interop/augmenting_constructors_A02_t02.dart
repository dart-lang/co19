// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting constructors works similar to augmenting a function,
/// with some extra rules to handle features unique to constructors like
/// redirections and initializer lists
///
/// @description Checks that an js interop constructor can be augmented. Test an
/// extension type and an object literal constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

@JS()
extension type ET._(JSObject _) implements JSObject {
  ET({int a, String b});
  external int a;
  external String b;
}

augment extension type ET {
  augment external ET({int a, String b});
}

main() {
  var et = ET(a: 1, b: '2');
  Expect.equals(1, et.a);
  Expect.equals('2', et.b);
}
