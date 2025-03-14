// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion throw: If `N` is a throw expression of the form `throw E1`, then:
/// - Let `before(E1) = before(N)`
/// - Let `after(N) = unreachable(after(E1))`
///
/// @description Checks that code after a throw expression is unreachable.
/// @author sgrekhov22@gmail.com

main() {
  late int i;
  if ((() => false)()) {
    throw "Dead code after this point";
    i = 42; // This is dead code, which leaves `i` definitely unassigned.
  }
  i;  // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}
