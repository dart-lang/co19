// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Optional parameters may be specified and provided with default
/// values.
/// defaultFormalParameter:
///   normalFormalParameter ('=' expression)?
/// ;
/// defaultNamedParameter:
///   normalFormalParameter (':' expression)?
/// ;
/// @description Checks that a declaration cannot be used instead of expression
/// in an optional named parameter declaration.
/// @author rodionov


f({var x: var z}) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  f();
}
