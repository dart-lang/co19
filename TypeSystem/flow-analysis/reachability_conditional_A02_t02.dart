// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Conditional statement: If `N` is a conditional statement of the
/// form `if (E) S1 else S2` then:
/// - Let `before(E) = before(N)`.
/// - Let `before(S1) = split(true(E))`.
/// - Let `before(S2) = split(false(E))`.
/// - Let `after(N) = merge(after(S1), after(S2))`.
///
/// @description Checks that if `E` has the form `if-case` then the flow
/// analysis will not conclude that a specific branch will definitely be taken,
/// even in the case where the scrutinee is a boolean literal and the pattern
/// is of the form `== b` where `b` is also a boolean literal. This is tested
/// via the definite assignment status of a variable.
/// @author sgrekhov22@gmail.com
/// @issue 60269

main() {
  int i;
  if (false case == true) { // same as if (false == true)...
  } else {
    i = 42;
  }
  i; // Not definitely assigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}
