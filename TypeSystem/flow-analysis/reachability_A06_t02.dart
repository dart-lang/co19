// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Null check operator: If `N` is an expression of the form `E!`,
/// then:
/// - Let `before(E) = before(N)`.
/// - Let `after(E) = promoteToNonNull(E, after(E))`.
///
/// @description Checks that `E!` is promoted to not null `after(E)`.
/// @author sgrekhov@unipro.ru
/// @issue 42021
/// @issue 60114

main () {
  int i;
  var s = "" as String?;
  if (s! != null) { // ignore: unnecessary_null_comparison
    i = 42;
  }
  i; // It is an error to read a local non-nullable variable which is definitely assigned
}
