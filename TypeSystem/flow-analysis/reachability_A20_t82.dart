// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Binary operator: All binary operators other than `==`, `&&`,
/// `||`, and `??` are handled as calls to the appropriate `operator` method.
///
/// @description Checks that if the static type of the expression of the form
/// `E1 += E2` is `Never` `after(N) = unreachable(after(E2))`.
/// @author sgrekhov22@gmail.com

class C {
  Never operator +(int other) => throw "";
}

void test() {
  late int i;
  if (2 > 1) {
    C c = C();
    c += 0;
    i = 42;
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
