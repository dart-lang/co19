// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String operator +(String other)
/// ...
/// @description Checks that if other string is null then it is a compile error
/// @author sgrekhov@unipro.ru


main() {
  "" + null;
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  r" " + null;
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  "\n" + null;
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
