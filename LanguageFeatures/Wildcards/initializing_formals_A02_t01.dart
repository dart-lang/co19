// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion No parameter with the name `_` is bound, which means `_` can't be
/// accessed inside the initializer list. The name `_` can be used in the body,
/// but this is a reference to the field, not to the parameter
///
/// @description Checks that it is a compile-time error to access constructor
/// parameter with name `_` inside the initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

int _ = 0;

class C {
  int _, a;
  C(this._) : a = _;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
