// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Even though the parameters no longer collide, it is still an
/// error to have two initializing formals named `_`
///
/// @description Checks that it is a compile-time error to declare more than one
/// initializing formals named `_`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C {
  int _;
  C(this._, this._);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
