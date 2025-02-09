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
/// @description Checks whether the code is reachable after invocation of a
/// getter whose type is other than `T <: Never`.
/// @author sgrekhov22@gmail.com

class C<T extends Never?> {
  T get n => throw "Lily was here";

  test() {
    try {
      late int i;
      bool b = (() => true)();
      if (b) {
        n;
        i = 42;
      }
      i; // Not an error
    } catch (_) {}
  }
}

main() {
  print(C);
}
