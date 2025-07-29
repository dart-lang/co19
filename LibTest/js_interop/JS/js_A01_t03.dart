// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that it is a compile-time error to have a top-level
/// external declaration without `@JS()` annotation.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

external int var1;
//           ^^^^
// [analyzer] unspecified
// [web] unspecified

external final String var2;
//                    ^^^^
// [analyzer] unspecified
// [web] unspecified

external int get getter;
//               ^^^^^^
// [analyzer] unspecified
// [web] unspecified

external int f1();
//           ^^
// [analyzer] unspecified
// [web] unspecified

external int f2(int v);
//           ^^
// [analyzer] unspecified
// [web] unspecified

external void set setter(int v);
//                ^^^^^^
// [analyzer] unspecified
// [web] unspecified

main() {
  print(var1);
  print(var2);
  print(getter);
  print(f1());
  print(f2(2));
  setter = 42;
}
