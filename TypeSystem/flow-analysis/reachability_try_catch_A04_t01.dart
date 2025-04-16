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
/// @description Checks that if `B` is empty then assignment in `alternatives`
/// is not treated as unreachable.
/// @author sgrekhov22@gmail.com

test() {
  late int i;
  try {
  } on Exception catch (_) {
    i = 42;
  }
  i; // Possibly assigned
}

main() {
  print(test);
}
