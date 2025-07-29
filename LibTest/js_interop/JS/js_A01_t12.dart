// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that it is a compile-time error if an enum is annotated
/// with `@JS()` annotation.
/// @author sgrekhov22@gmail.com
/// @issue 61208

import 'dart:js_interop';

class C {}

@JS()
extension ExtC on C {
//        ^^^^
// [analyzer] unspecified
// [web] unspecified
}

mixin M {}

@JS()
extension ExtM on M {
//        ^^^^
// [analyzer] unspecified
// [web] unspecified
}

enum E {
  e0;
}

@JS()
extension ExtE on E {
//        ^^^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
}
