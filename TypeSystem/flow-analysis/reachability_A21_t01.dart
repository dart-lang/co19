// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Null check operator: If `N` is an expression of the form `E!`,
/// then:
/// - Let `before(E) = before(N)`.
/// - Let `after(E) = promoteToNonNull(E, after(E))`.
///
/// @description Checks that for expression of the form `E!`
/// `after(E) = promoteToNonNull(E, after(E))`.
/// @author sgrekhov22@gmail.com
/// @issue 60114

main() {
  int? n = 2 > 1 ? 1 : null;
  int i;

  n!;
  if (n != null) { // ignore: unnecessary_null_comparison
    i = 42;
  }
  i;  // Definitely assigned
}
