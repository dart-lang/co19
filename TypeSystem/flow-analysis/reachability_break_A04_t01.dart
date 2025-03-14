// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Break statement: If N is a statement of the form break [L];, then:
///
///  Let S be the statement targeted by the break. If L is not present, this is
///  the innermost do, for, switch, or while statement. Otherwise it is the do,
///  for, switch, or while statement with a label matching L.
///
///  Update break(S) = join(break(S), before(N)).
///
///  Let after(N) = unreachable(before(N)).
///
/// @description Checks reachability after break statement. Test `switch`
/// statement
/// @author sgrekhov@unipro.ru

main() {
  late int i;
  int j = 42;
  switch (j) {
    case 42:
      break;
      i = 42; // This is dead code, which leaves `i` definitely unassigned.
    case 43:
  }
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}
