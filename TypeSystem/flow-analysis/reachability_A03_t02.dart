// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion False literal: If `N` is the literal `false`, then:
///  Let `true(N) = unreachable(before(N))`.
///  Let `false(N) = before(N)`
///
/// @description Checks reachability after `false` literal
/// @author sgrekhov@unipro.ru

main() {
  late int i;
  false ? i = 42 : "nothing"; // Variable is initialized in a dead code. This leaves it definitely unassigned
  i;  // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}
