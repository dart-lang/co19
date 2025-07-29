// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that a library directive  can be annotated with `@JS()`
/// annotation.
/// @author sgrekhov22@gmail.com

@JS("lib1")
library;

import 'dart:js_interop';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
external int foo();

main() {
  eval(r'''
    globalThis.foo = function() {return 42;};
  ''');
  Expect.throws(() {
    foo(); // There is no lib1.foo() function therefore expect an exception
  });
}
