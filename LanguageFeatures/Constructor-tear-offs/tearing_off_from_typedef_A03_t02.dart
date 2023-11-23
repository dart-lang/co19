// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This differs for a generic type alias. If the type alias is
/// instantiated (implicitly or explicitly), then the result is still the same
/// as tearing off the aliased type directly, and it's constant and
/// canonicalized if the type arguments are constant.
///
/// @description Checks that if type alias is instantiated, the result is the
/// same as tearing off the aliased type directly. Test negative static cases.
///
/// @author iarkh@unipro.ru

typedef MyList<T> = List<T>;

main() {
  var v = MyList<int>.filled;
  v(3, "");
//     ^
// [analyzer] unspecified
// [cfe] unspecified

  var v1 = MyList<String>.filled;
  v1(3, null);
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  v1(3, 4);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
