// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Executing a return statement with no expression,` return;`
/// returns without an object.
///
/// @description Checks that it is a compile-time error if a return statement of
/// the form `return;` appears in a factory constructor.
/// @author sgrekhov22@gmail.com

class C {
  C();
  factory C.f() {
    if (1 > 2) {
      return;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    return C();
  }
}

extension type ET(int _) {
  factory ET.f() {
    if (1 > 2) {
      return;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    return ET(0);
  }
}

main() {
  print(C);
  print(ET);
}
