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
/// @description Checks that if `E` has the form `if-case` then an assignment in
/// the `when` part is not treated as definite assignment even if all conditions
/// are `true`.
/// @author sgrekhov22@gmail.com
/// @issue 60269

main() {
  int i;
  if (true case == true when (i = 42) > 0) {
    print("Ok");
  }
  i; // Not definitely assigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}
