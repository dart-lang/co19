// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for each statement: If `N` is a for statement of the form
/// `for (T X in E) S`, `for (var X in E) S`, or `for (X in E) S`, then:
/// - Let `before(E) = before(N)`
/// - Let `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
/// - Let `after(N) = join(before(S), break(S))`
///
/// @description Checks that
/// `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`. Test
/// that if a variable is captured in `S` then it doesn't affect `E`
/// (`conservativeJoin` starts `after(E)`).
/// @author sgrekhov22@gmail.com
/// @issue 60376

class C {
  int v;
  C(this.v);
}

test1(int? n) {
  if (n != null) { // n promoted to `int`
    for (var i in <int>[42, n]) { // Ok, n is still `int` here.
      late int? x = (n = 42); // n demoted to `int?`
    }
  }
}

test2(int? n) {
  if (n != null) {
    for (var i in <int>[42, n]) {
      late (int?,) x = ((n,) = (42,));
    }
  }
}

test3(int? n) {
  if (n != null) {
    for (var i in <int>[42, n]) {
      late ({int? x}) x = ((x: n) = (x: 42));
    }
  }
}

test4(int? n) {
  if (n != null) {
    for (var i in <int>[42, n]) {
      late C x = (C(v: n) = C(42));
    }
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
