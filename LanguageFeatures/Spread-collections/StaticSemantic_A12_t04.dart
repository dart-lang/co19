// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion n/a
/// @description: Checks that spread elements in the set cannot have recurrent
/// references.
/// @author iarkh@unipro.ru

main() {
  Set s1 = {...s2};
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  Set s2 = {...s1};
}
