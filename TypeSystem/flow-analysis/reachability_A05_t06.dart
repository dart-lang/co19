// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion other literal: If N is some other literal than the above, then:
///  Let null(N) = unreachable(before(N)).
///  Let notNull(N) = before(N)
///
/// @description Checks reachability after double literal
/// @author sgrekhov@unipro.ru
/// @issue 41985

// @dart = 3.7

main() {
  int i;
  if (3.14 != null) {
    i = 42; // `i` is not definitely unassigned because in a weak mode a value
            // of a non-nullable expression is considered to be possibly null
  }
  i; // It is an error to read a local non-nullable variable which is not definitely assigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}
