// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static error when the type of the condition expression in
/// an if element may not be assigned to bool.
///
/// @description Checks that it is a static error when the type of the condition
/// expression in an if element may not be assigned to bool
/// @author sgrekhov@unipro.ru

main() {
  [if ("not bool") 1];
//     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  <int>[if ("not bool") 1];
//          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const [if ("not bool") 1];
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const <int>[if ("not bool") 1];
//                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
