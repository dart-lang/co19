// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Variable or getter: If N is an expression of the form x where the
/// type of x is T then:
///
/// If T <: Never then:
///  Let null(N) = unreachable(before(N)).
///  Let notNull(N) = unreachable(before(N)).
/// Otherwise if T <: Null then:
///  Let null(N) = before(N).
///  Let notNull(N) = unreachable(before(N)).
/// Otherwise if T is non-nullable then:
///  Let null(N) = unreachable(before(N)).
///  Let notNull(N) = before(N).
///
/// @description Checks reachability after variable or getter. Test variable of
/// type Null
///
/// @author sgrekhov@unipro.ru
/// @issue 41985

// Requirements=nnbd-weak

main() {
  int i;
  Null n = null;
  if (n == null) {
    i = 42; // condition is always true therefore `i` must be definitely assigned
  }
  i; // It's not an error to read local non-nullable variable if it is definitely assigned
}
