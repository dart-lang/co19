// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if the name of a named
/// optional parameter begins with an _ character.
/// @description Checks that it is a compile-time error if the name of a named
/// optional parameter begins with an '_' character.
/// @author rodionov
/// @reviewer kaigorodov


class A {
  var _p;
  A({this._p: ""}) {
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    print(_p);
  }
}

main() {
  try {
    new A(_p: "Optional parameters names must not begin with an underscore!");
  } catch (x) {}
}
