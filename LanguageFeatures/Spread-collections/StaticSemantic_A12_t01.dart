// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion n/a
/// @description: Checks that list with spread element cannot reference itself
/// @author iarkh@unipro.ru


main() {
  List l1  = [...l1];
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l2  = [...[l2]];
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l3  = [...{l3}];
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l4  = [...[...l4]];
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l5  = [...{...l5}];
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified

  List l6  = [...?l6];
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l7  = [...?[l7]];
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l8  = [...?{l8}];
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l9  = [...?[...?l9]];
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l10 = [...?{...?l10}];
//                     ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
