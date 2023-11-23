// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion null literal: If N is the literal null, then:
///  Let null(N) = before(N).
///  Let notNull(N) = unreachable(before(N))
/// @description Checks reachability after null literal
///
/// @author sgrekhov@unipro.ru
/// @issue 41985


main() {
  late int i;
  if (null != null) {
    i = 42;  // Variable is initialized in a dead code. This leaves it definitely unassigned
  }
  i;  // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}
