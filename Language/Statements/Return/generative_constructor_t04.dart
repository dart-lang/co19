// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a return statement of the form
/// `return e;` appears in a generative constructor.
///
/// @description Checks that it is a compile-time error if a return statement of
/// the form `return e;` appears in a body part of a primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C(var int v) {
  this {
    return this;
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(int v) {
  this {
    return null;
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(ET);
}
