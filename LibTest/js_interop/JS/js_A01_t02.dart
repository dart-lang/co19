// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that it is a compile-time error if `@JS()` annotation is
/// applied to a function with any named parameters.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@JS()
external int f1({int v});
//                   ^
// [analyzer] unspecified
// [web] unspecified

@JS()
external int f2({required int v});
//                            ^
// [analyzer] unspecified
// [web] unspecified

main() {
  print(f1());
  print(f2(v: 1));
}
