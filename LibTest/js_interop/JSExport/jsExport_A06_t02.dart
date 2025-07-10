// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Only concrete instance members can and will be wrapped, and it's
/// an error to annotate other members with this annotation.
///
/// @description Checks that it is a compile-time error if a constructor is
/// annotated with a `@JSExport()`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

class C {
  @JSExport()
  C();
//^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  const C.n();
//      ^^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  factory C.f() = C;
//        ^^^
// [analyzer] unspecified
// [web] unspecified
}

void main() {
  print(C);
}
