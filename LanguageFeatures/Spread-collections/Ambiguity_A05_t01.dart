// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion (Unified collections) Let [e] be a [setOrMapLiteral].
///
/// If [e] has a context [C], and the base type of [C] is [Cbase] (that is,
/// [Cbase] is [C] with all wrapping [FutureOrs] removed), and [Cbase] is not
/// [?], then let [S] be the greatest closure.
///
/// If [e] has [typeArguments] then:
/// ...
/// Otherwise (three or more type arguments), report a compile-time error.
///
/// @description Checks that [setOrMapLiteral] has one type argument, it's a set.
/// @author iarkh@unipro.ru


main() {
  Set? aSet   = {1, 2, 3};
  List? aList = [1, 2, 3];
  Map? aMap   = {1: 1, 2: 2, 3: 3};

  var res1  = <int, int, int>{...aList};
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var res2  = <int, int, int, int>{...aList};
//            ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var res3  = <int, int, int, int, int>{...aList};
//            ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var res4  = <int, int, int>{...?aList};
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var res5  = <int, int, int, int>{...?aList};
//            ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var res6  = <int, int, int, int, int>{...?aList};
//            ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var res7  = <int, int, int>{...aSet};
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var res8  = <int, int, int, int>{...aSet};
//            ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var res9  = <int, int, int, int, int>{...aSet};
//            ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var res10 = <int, int, int>{...?aSet};
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var res11 = <int, int, int, int>{...?aSet};
//            ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var res12 = <int, int, int, int, int>{...?aSet};
//            ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var res13 = <int, int, int>{...aMap};
//            ^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
  var res14 = <int, int, int, int>{...aMap};
//            ^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
  var res15 = <int, int, int, int, int>{...aMap};
//            ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.

  var res16 = <int, int, int>{...?aMap};
//            ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var res17 = <int, int, int, int>{...?aMap};
//            ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var res18 = <int, int, int, int, int>{...?aMap};
//            ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
