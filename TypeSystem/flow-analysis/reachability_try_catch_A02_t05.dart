// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion try catch: If `N` is a try/catch statement of the form
/// `try B alternatives` then:
/// - Let `before(B) = before(N)`
/// - For each catch block on `Ti Si` in alternatives:
///   - Let
///     `before(Si) = conservativeJoin(before(N), assignedIn(B), capturedIn(B))`
/// - Let `after(N) = join(after(B), after(C0), ..., after(Ck))`
///
/// @description Checks that
/// `after(N) = join(after(B), after(C0), ..., after(Ck))`. Test that if some
/// promoted variable is captured in `Si` then it is still promoted in another
/// `Sj`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1(int? n) {
  if (n != null) {  // `n` promoted to `int`
    try {
    } on Exception catch (_) {
      () {n = 42;}; // `n` demoted to `int?`
    } catch (_) {
      n.isEven; // still promoted
    }
  }
}

test2(int? n) {
  if (n != null) {
    try {
    } on Exception catch (_) {
      n.isEven;
    } catch (_) {
      () {(n,) = (42,);};
    }
  }
}

test3(int? n) {
  if (n != null) {
    try {
    } on Exception catch (_) {
      () {(x: n) = (x: 42);};
    } catch (_) {
      n.isEven;
    }
  }
}

test4(int? n) {
  if (n != null) {
    try {
    } on Exception catch (_) {
      n.isEven;
    } catch (_) {
      () {C(v: n) = C(42);};
    }
  }
}

main() {
  test1(1);
  test2(2);
  test3(3);
  test4(4);
}
