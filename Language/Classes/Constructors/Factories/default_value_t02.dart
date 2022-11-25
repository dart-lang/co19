// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if k explicitly specifies a default
/// value for an optional parameter.
/// @description Checks that it is a compile-error if redirecting factory
/// constructor specifies a default value for its optional named parameter.
/// @author ilya


class F {
  factory F(int x, {int y: 0}) = C;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C implements F {
  C(int x, {int y = 0});
}

main() {
  new F(1);
}
