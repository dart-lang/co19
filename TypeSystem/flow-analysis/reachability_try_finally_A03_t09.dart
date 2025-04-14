// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion try finally: If `N` is a try/finally statement of the form
/// `try B1 finally B2` then:
/// - Let `before(B1) = split(before(N))`
/// - Let `before(B2) = split(join(drop(after(B1)),
///     conservativeJoin(before(N), assignedIn(B1), capturedIn(B1))))`
/// - Let `after(N) = restrict(after(B1), after(B2), assignedIn(B2))`
///
/// @description Checks that
/// `after(N) = restrict(after(B1), after(B2), assignedIn(B2))`. Test that if
/// some variable is assigned in a catch part of `B1` and it throws then it is
/// definitely unassigned in dead code `after(N)`.
/// @author sgrekhov22@gmail.com
/// @issue 60503

class C {
  int v;
  C(this.v);
}

Never foo() => throw "Never";

test1() {
  late int i;
  try {
    print("To avoid empty body");
  } catch (_) {
    foo();
    i = 42;
  } finally {
  }
  i; // Definitely unassigned and in dead code
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2(Never n) {
  late int i;
  try {
    print("To avoid empty body");
  } catch (_) {
    (i,) = (42,);
    n;
  } finally {
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test3<T extends Never>(T n) {
  int i;
  try {
    print("To avoid empty body");
  } catch (_) {
    n;
    (x: i) = (x: 42);
  } finally {
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test4() {
  int i;
  try {
    print("To avoid empty body");
  } catch (_) {
    C(v: i) = C(42);
    foo();
  } finally {
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
