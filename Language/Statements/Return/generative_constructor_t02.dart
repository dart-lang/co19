// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a return statement of the form
/// `return e;` appears in a generative constructor.
///
/// @description Checks that a compile-time error occurs if a return statement
/// of the form `return e;` appears in a generative constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C {
  C() {
    return D();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class D extends C {}

extension type ET(int v) {
  ET.foo(this.v) {
    return ET(0);
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(ET);
}
