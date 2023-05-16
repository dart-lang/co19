// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not a compile-time error if the values of the expressions
/// ek are not either::
/// • instances of the same class C, for all k in 1..n, or
/// • instances of a class that implements int, for all k in 1..n, or
/// • instances of a class that implements String, for all k in 1..n.
///
/// @description Checks that it is not a compile-time error if case expressions
/// of a switch statement with a default case have different types.
/// @author msyabro

main() {
  var x = 1;

  switch (x) {
    case 0:
    case 2:
    case "false":
    default:
  }
}
