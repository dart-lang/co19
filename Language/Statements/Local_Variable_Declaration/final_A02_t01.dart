// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a local variable v is final and not late, it is not a
/// compile-time error if the declaration of v is not an initializing variable
/// declaration, but an expression that gives rise to evaluation of v is a
/// compile-time error unless flow analysis shows that the variable is
/// guaranteed to have been initialized. Similarly, an expression that gives
/// rise to an assignment to v is a compile-time error unless flow analysis
/// shows that it is guaranteed that the variable has not been initialized.
///
/// In every situation which is not covered by the previous paragraph, it is a
/// compile-time error to assign to a local variable which is final and not late
///
/// @description Checks that it is a compile-time error to read a local
/// definitely unassigned final variable.
/// @author ilya

main() {
  final i;
  var j = i;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
