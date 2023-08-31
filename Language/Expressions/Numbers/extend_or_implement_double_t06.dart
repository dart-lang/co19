// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error for a class to attempt to extend,
/// mix in or implement double.
/// @description Checks that double cannot be mixed in. Test class C = M form
/// @author sgrekhov@unipro.ru


class A {}

class C = A with double;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  C();
}
