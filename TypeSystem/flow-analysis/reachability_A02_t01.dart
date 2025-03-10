// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion True literal: If `N` is the literal `true`, then:
///  Let `true(N) = before(N)`.
///  Let `false(N) = unreachable(before(N))`.
///
/// @description Checks reachability after `true` literal
/// @author sgrekhov@unipro.ru

main() {
  int i;
  if (true) {
    i = 42;   // Variable is definitely assigned here
  }
  i;  // It's not an error to read local non-nullable variable which is definitely assigned
}
