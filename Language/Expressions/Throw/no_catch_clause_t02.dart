// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The throw expression is used to raise an exception.
/// throwExpression:
///   throw expression
/// ;
/// throwExpressionWithoutCascade:
///   throw expressionWithoutCascade
/// ;
/// @description Checks that it is a compile-error if to use throw with no
/// expression in while statement.
/// @author rodionov
/// @reviewer kaigorodov


main() {
  while (false) {
    throw;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
