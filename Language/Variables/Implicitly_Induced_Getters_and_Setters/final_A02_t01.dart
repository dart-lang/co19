// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a final instance variable that has
/// been initialized by means of an initializing formal of a constructor `k` is
/// also initialized in the initializer list of `k`.
///
/// @description Checks that it is a compile error to initialize final instance
/// variable both in initializing formal and initializer list.
/// @author rodionov

class C {
  final v;
  C(this.v) : v = 1 {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(0);
  final v;
  const E(this.v) : v = 1;
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
}
