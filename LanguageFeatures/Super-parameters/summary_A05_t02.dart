// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Effectively, each super parameters, super.p:
/// ...
/// Cannot be positional if the super-constructor invocation already has
/// positional arguments.
///
/// @description Check that super parameter сannot be positional if the
/// super-constructor invocation already has positional arguments.
/// @author sgrekhov@unipro.ru

class S {
  num s1, s2, s3;
  S(this.s1, this.s2 , {this.s3 = 3.14});
}

class C extends S {
  int c;
  C(this.c, super.s2) : super(42, s3: 0);
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C(1, 2);
}
