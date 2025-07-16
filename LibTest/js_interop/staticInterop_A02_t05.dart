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
/// @description Checks that it is a compile-time error if a mixin annotated
/// with `@staticInterop` declares any instance members.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@staticInterop
@JS()
mixin M1 {
  int x = 0;
//    ^
// [analyzer] unspecified
// [web] unspecified
}

@staticInterop
@JS()
mixin M2 {
  int get x => 0;
//        ^
// [analyzer] unspecified
// [web] unspecified
}

@staticInterop
@JS()
mixin M3 {
  int x() => 0;
//    ^
// [analyzer] unspecified
// [web] unspecified
}

@staticInterop
@JS()
mixin M4 {
  void set x(int _) {}
//         ^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
}
