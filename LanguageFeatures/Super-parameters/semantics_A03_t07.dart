// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s also a compile-time error if a constructor has a positional
/// super-parameter and the super-constructor invocation at the end of its
/// initializer list has a positional argument.
///
/// @description Check that it is a compile-time error if a declaring
/// constructor has a positional super-parameter and the super-constructor
/// invocation at the end of its initializer list has an optional positional
/// argument.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class S {
  int s1;
  int s2 = 0;
  S([this.s1 = 1, this.s2 = 2]);
}

class C1(this.i1, super.s2, int i) extends S {
  int i1;
  int i2;
  this : this.i2 = i, super.n(i);
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2.someName(this.i1, super.s2, int i) extends S {
  int i1;
  int i2;
  this.someName : this.i2 = i, super.n(i);
//                             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 extends S {
  int i1;
  int i2;
  this(this.i1, super.s2, int i) : this.i2 = i, super.n(i);
//                                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 extends S {
  int i1;
  int i2;
  this.someName(this.i1, super.s2, int i) : this.i2 = i, super.n(i);
//                                                       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
}
