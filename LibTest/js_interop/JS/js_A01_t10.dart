// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that it is a compile-time error if a typedef is annotated
/// with a `@JS()` annotation.
/// @author sgrekhov22@gmail.com
/// @issue 61208

import 'dart:js_interop';

class C {
}

mixin M {
}

enum E {
  e0;
}

@JS()
typedef CAlias = C;
//      ^^^^^^
// [analyzer] unspecified
// [web] unspecified

@JS()
typedef MAlias = M;
//      ^^^^^^
// [analyzer] unspecified
// [web] unspecified

@JS()
typedef EAlias = E;
//      ^^^^^^
// [analyzer] unspecified
// [web] unspecified

main() {
  print(CAlias);
  print(MAlias);
  print(EAlias);
}
