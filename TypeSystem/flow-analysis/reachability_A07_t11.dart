// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Method invocation: If `N` is an expression of the form
/// `E1.m1(E2)`, then:
///  - Let `before(E1) = before(N)`
///  - Let `before(E2) = after(E1)`
///  - Let `T` be the static return type of the invocation
///  - If `T <: Never` then:
///   - Let `after(N) = unreachable(after(E2))`.
///  - Otherwise:
///    - Let `after(N) = after(E2)`
///
/// @description Checks reachability after method invocation. Tests a method
/// with a non-nullable return type.
/// @author sgrekhov22@gmail.com

class C {
  String m1() => "Non-nullable";
}

main() {
  C c = new C();
  late int i;
  if (c.m1() == null) { // ignore: unnecessary_null_comparison
    i = 42;
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}
