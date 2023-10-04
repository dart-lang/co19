// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Local variables are added to the innermost enclosing scope.
/// They do not induce getters and setters.  A local variable may only be
/// referenced at a source code location that is after its initializer, if any,
/// is complete, or a compile-time error occurs.
/// @description Checks that it is a compile-error if local variable is used
/// before its initializer.
/// @author kaigorodov
/// @reviewer rodionov

main() {
  var v = w;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  var w;
}
