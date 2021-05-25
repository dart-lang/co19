// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In general, a non-generic type alias is just expanded to its
/// aliased type, then the tear-off happens on that type. Tearing off
/// [IntList.filled] will act like tearing off [List<int>.filled], it
/// automatically instantiates the class type parameter to the specified type.
///
/// @description Checks that tearing-off automatically instantiates the class
/// type parameter to the specified type for non-generic type alias. Test
/// negative static case for raw List.
/// @author iarkh@unipro.ru

typedef MyList = List;

main() {
  MyList<int>.filled;
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  MyList<String>.filled;
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  MyList<dynamic>.filled;
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  MyList<Object?>.filled;
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  MyList<Never>.filled;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
