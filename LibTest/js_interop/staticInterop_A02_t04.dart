// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `staticInterop` enables the JS annotated class to be treated as
/// a "static" interop class.
///
/// These classes allow interop with native types, like the ones in `dart:html`.
/// These classes should not contain any instance members, inherited or
/// otherwise, and should instead use static extension members.
///
/// @description Checks that it is a compile-time error if a class annotated
/// with `@staticInterop` declares any external generative constructors.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@staticInterop
@JS()
class C {
  external C();
//         ^
// [analyzer] unspecified
// [web] unspecified

  external C.n(int x);
//         ^^^
// [analyzer] unspecified
// [web] unspecified

  external factory C.f(); // Factory constructors are allowed
}

main() {
  print(C);
}
