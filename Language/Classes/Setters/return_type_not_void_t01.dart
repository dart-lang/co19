// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile error if a setter declares a return type other
/// than void
/// @description Checks that it is a compile error if a setter declares a return
/// type other than void
/// @author vasya
/// @issue 42179


class C {
  int set foo(var x) => 42;
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C().foo = 1;
}
