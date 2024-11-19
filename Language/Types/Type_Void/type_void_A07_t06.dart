// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that it is a compile error to use an alias of the type
/// `void` expression as an actual parameter.
/// @author sgrekhov22@gmail.com

typedef Void = void;

extension type ET(Void v) {
  void test() {
    print(v);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    print(this.v);
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(ET);
}
