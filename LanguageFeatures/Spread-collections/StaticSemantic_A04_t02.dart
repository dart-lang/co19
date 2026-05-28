// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static error if:
///    A spread element in a list or set literal has a static type that is not
///    assignable to Iterable<Object>.
///
/// @description Checks that compile error is thrown if spread element in set
/// literal is not assignable to [Iterate<Object>]
/// @author iarkh@unipro.ru

main() {
  var number = 1;
  var str = "checkme";
  var map = {1: 1, 2: 2};
  var list = [1, 2, 3, 4, 5];

  Set l1 = <dynamic>{...number};
//                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Set l2 = <dynamic>{...str};
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  Set l3 = <dynamic>{...map};
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  Set l4 = <dynamic>{...list[0]};
//                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Set l5 = <dynamic>{...?number}; // ignore: invalid_null_aware_operator
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Set l6 = <dynamic>{...?str}; // ignore: invalid_null_aware_operator
//                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  Set l7 = <dynamic>{...?map}; // ignore: invalid_null_aware_operator
//                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  Set l8 = <dynamic>{...?list[0]}; // ignore: invalid_null_aware_operator
//                       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
