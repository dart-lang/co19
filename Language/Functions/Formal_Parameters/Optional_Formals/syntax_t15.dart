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
/// @description Checks that it is a compile-time error when the ':'
/// character is used in an optional positional parameter declaration.
/// @author rodionov


foo([var a = 1, var b: 2]) {
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  return a;
}

main() {
  foo();
}
