// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Binary operator: All binary operators other than `==`, `&&`,
/// `||`, and `??` are handled as calls to the appropriate `operator` method.
///
/// @description Checks that if the static type of the expression of the form
/// `E1 ~/= E2` is `Never` then `E2` is still reachable.
/// @author sgrekhov22@gmail.com

class C {
  Never operator ~/(int x) => throw "C";
}

main() {
  late int i;
  try {
    C c = C();
    c ~/= (i = 42);
  } catch (_) {}
  i; // Not definitely unassigned
}
