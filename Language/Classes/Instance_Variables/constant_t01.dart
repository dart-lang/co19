// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an instance variable is declared
/// to be constant.
///
/// @description Checks that it is a compile-time error if an instance variable
/// is declared to be constant.
/// @author sgrekhov@unipro.ru

class C {
  const v1 = 1;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C().v1;
}
