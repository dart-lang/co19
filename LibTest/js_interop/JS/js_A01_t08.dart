// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that it is a compile-time error if an enum is annotated
/// with a `@JS()` annotation.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@JS()
enum E {
//   ^
// [analyzer] unspecified
// [web] unspecified
  e0;

  external final int var1;

  external int get x;

  external void set x(int v);

  external int f1();

  external int f2(int v);
}

main() {
  print(E);
}
