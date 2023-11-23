// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A mixin declaration introduces a mixin and an interface, but not a
/// class.
///
/// @description Checks that a mixin declaration introduces not a class.
/// @author sgrekhov@unipro.ru

class C {
}

mixin M on C {
}

main() {
  new M();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}
