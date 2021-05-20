// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile type error occurs if a variable is
/// being assigned an expression of incompatible type
/// @description Checks that a compile type error occurs if a variable is
/// being assigned an expression of incompatible type (failed implicit subtype
/// test).
/// @author rodionov


main() {
  var i = 1;
  String v = i;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}
