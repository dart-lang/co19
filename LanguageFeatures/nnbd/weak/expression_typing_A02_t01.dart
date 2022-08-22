// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calling a method (including an operator) or getter on a receiver
/// of static type Never is treated by static analysis as producing a result of
/// type Never.
///
/// @description Checks that calling a method (including an operator) or getter
/// on a receiver of static type [Never] is treated by static analysis as
/// producing a result of type [Never] (except members of [Object]).
/// @issue 41273
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak

void test(var x) {
  if (x is Never) {
    Never n1 = x.toString();
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    Never n2 = x.runtimeType;
//               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    Never n3 = x.someGetter;
    Never n4 = x.someMethod();
    Never n5 = x + x;
  }
}

main() {
  test(null);
}
