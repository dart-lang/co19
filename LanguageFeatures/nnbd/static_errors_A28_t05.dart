/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile time error to assign a value to a local variable
 * marked late and final when the variable is definitely assigned. This includes
 * all forms of assignments, including assignments via the composite assignment
 * operators as well as pre and post-fix operators.
 *
 * @description Check that it is a compile time error to assign a value to a
 * local variable marked late and final when the variable is definitely assigned
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class C {
  C operator +(int val) {
    return this;
  }

  C operator -(int val) {
    return this;
  }
}

main() {
  late final C x = new C();
  x++;
// ^^
// [analyzer] unspecified
// [cfe] unspecified
  ++x;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  x--;
// ^^
// [analyzer] unspecified
// [cfe] unspecified

  --x;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
