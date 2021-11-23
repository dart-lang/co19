// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if var occurs as the first token of a
/// <superFormalParameter> production. (It’s generally a compile-time error if
/// const or late occurs in a parameter declaration, this also applies to
/// super-parameters).
///
/// @description Check that it is a compile-time error if const occurs as the
/// first token of a <superFormalParameter> production
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

class S {
  int s1;
  S({this.s1 = 0});
}

class C extends S {
  int i;
  C(this.i, {const super.s1}) {
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    this.i = i;
  }
}
main() {
  C(42, s1: 0);
}
