// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Tearing off a method from a receiver of static type[ Never]
/// produces a value of type [Never].
///
/// @description Checks that tearing off a method from a receiver of static type
/// [Never] produces a value of type [Never] (except members of [Object]).
/// @issue 41273
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-strong

void test(var x) {
  if (x is Never) {
    Never n1 = x.toString;
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    Never n2 = x.someMethod;
  }
}

main() {
  test(null);
}
