// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion n/a
/// @description: Checks that set with spread element cannot reference itself
/// @author iarkh@unipro.ru


main() {
  Set s1  = {...s1};
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  Set s2  = {...[s2]};
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
  Set s3  = {...{s3}};
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
  Set s4  = {...{...s4}};
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
  Set s5  = {...[...s5]};
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  Set s6  = {...?s6};
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
  Set s7  = {...?[s7]};
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
  Set s8  = {...?{s8}};
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
  Set s9  = {...?{...?s9}};
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
  Set s10 = {...?[...?s10]};
//                    ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
