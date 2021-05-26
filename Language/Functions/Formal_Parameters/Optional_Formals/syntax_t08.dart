// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Optional parameters may be specified and provided with default
/// values.
/// defaultFormalParameter:
///   normalFormalParameter ('=' expression)?
/// ;
/// defaultNamedParameter:
///   normalFormalParameter (':' expression)?
/// ;
/// @description Checks that the ':' character in an optional named parameter
/// declaration must be followed by an expression.
/// @author rodionov
/// @reviewer kaigorodov


f({var x: }) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  try {
    f();
  } catch (x) {}
}
