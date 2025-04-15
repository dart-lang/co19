// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks reachability after method call. Test return type `Never`
/// @author sgrekhov@unipro.ru

class C {
  Never m1() => throw "Exception";
}

main() {
  C c = new C();
  try {
    late int i;
    bool b = (() => true)();
    if (b) {
      c.m1();     // The code after this point is unreachable
      i = 42;     // This is dead code, which leaves `i` definitely unassigned.
    }
    i; // It is an error to read a local late variable when it is definitely unassigned.
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (_) {
  }
}
