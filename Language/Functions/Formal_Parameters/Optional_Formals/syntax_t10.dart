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
/// @description Checks that reassigning a final optional parameter inside the
/// function produces a compile error
/// @author rodionov
/// @reviewer kaigorodov


foo({final p: 1}) {
  p = 1;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  foo();
}
