// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s also a compile-time error if a constructor has a positional
/// super-parameter and the super-constructor invocation at the end of its
/// initializer list has a positional argument.
///
/// @description Check that it is a compile-time error if a declaring
/// constructor has a positional super-parameter and the super-constructor
/// invocation at the end of its initializer list has a positional argument.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class S {
  int s;
  S(this.s);
}

class C1(super.s) extends S {
  this : super(0);
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2.someName(super.s) extends S {
  this.someName : super(0);
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 extends S {
  this(super.s) : super(0);
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 extends S {
  this.someName(super.s) : super(0);
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4  );
}
