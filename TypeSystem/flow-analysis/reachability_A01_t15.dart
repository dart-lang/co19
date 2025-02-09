// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// - Variable or getter: If `N` is an expression of the form `x` where the
///   type of `x` is `T` then:
/// If `T <: Never` then:
///   - Let `after(N) = unreachable(before(N))`.
/// Otherwise:
///   - Let `after(N) = before(N)`.
///
/// @description Checks whether the code is reachable after a variable of a type
/// other that `Never`.
/// @author sgrekhov22@gmail.com

void test(Never? n) {
  late int i;
  bool b = (() => true)();
  if (b) {
    n;
    i = 42;
  }
  i; // Not an error
}

main() {
  try {
    test(throw "Lily was here");
  } catch (_) {}
}
