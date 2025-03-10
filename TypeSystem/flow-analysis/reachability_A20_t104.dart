// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Binary operator: All binary operators other than `==`, `&&`,
/// `||`, and `??` are handled as calls to the appropriate `operator` method.
///
/// @description Checks that if the static type of the expression of the form
/// `E1 ~/= E2` static type of `E1`is not `Never` then `after(N) = after(E2)`.
/// This is tested by detecting that `i = 42` is considered to be guaranteed to
/// have been executed when `i;` is executed.
/// @author sgrekhov22@gmail.com

class C {
  num n;
  C(this.n);
  C operator ~/(int other) => C(n - other);
}

main() {
  int i;
  C c = C(1);
  c ~/= (i = 42);
  i; // Definitely assigned
}
