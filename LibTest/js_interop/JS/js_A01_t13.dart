// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that it is a compile-time error if external member of JS
/// interop extension type uses non-valid JS interop type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

class C {}

@JS()
external void f1(C v);
//            ^^
// [analyzer] unspecified
// [web] unspecified

@JS()
external C f2();
//         ^^
// [analyzer] unspecified
// [web] unspecified

@JS()
external C var1;
//         ^^^^
// [analyzer] unspecified
// [web] unspecified

@JS()
external final C var2;
//               ^^^^
// [analyzer] unspecified
// [web] unspecified

@JS()
external C get getter;
//             ^^^^^^
// [analyzer] unspecified
// [web] unspecified

@JS()
external void set setter(C v);
//                ^^^^^^
// [analyzer] unspecified
// [web] unspecified

main() {
  print(var1);
  print(var2);
  print(getter);
}
