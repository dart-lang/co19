// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable only if
/// (a) it is private,
/// (b) it is final, and
/// (c) all other concrete instance getters with the same name in the same
/// library are also final fields
///
/// @description Checks that an instance field is not promotable if it is not
/// private. Test type variable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inference-update-2

class C<T> {
  final T x;
  C(this.x);

  void test() {
    if (x is int) {
      x.isOdd;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

main() {
  C(42).test();
}
