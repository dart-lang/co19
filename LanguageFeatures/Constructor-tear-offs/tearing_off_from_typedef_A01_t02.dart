// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With generalized type-aliases, it's possible to declare a
/// class-alias like [typedef IntList = List<int>;]. We allow calling
/// constructors on such a type alias, so we will also allow tearing off such a
/// constructor.
///
/// @description Checks that type parameters are processed correctly for teared
/// off constructor.
/// @author iarkh@unipro.ru

typedef IntList = List<int>;

main() {
  var v = IntList.filled;
  v(3, "This is a String");
//     ^
// [analyzer] unspecified
// [cfe] unspecified

  v(3, null);
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}
