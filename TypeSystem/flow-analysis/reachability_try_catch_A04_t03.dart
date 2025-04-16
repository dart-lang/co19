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
/// @description Checks that if `B` is empty and a type `T` is made a type of
/// interest in `alternatives` then it cannot be promoted in `after(N)`.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) https://github.com/dart-lang/language/issues/4328

class S {}

class T extends S {
  int answer() => 42;
}

main() {
  S s = S();
  try {
  } on Exception catch (_) {
    if (s is T) {} // Make `T` a type of interest
  }
  s = T();
  s.answer(); // ???
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
