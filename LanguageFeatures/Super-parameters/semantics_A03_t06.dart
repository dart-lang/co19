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

// SharedOptions=--enable-experiment=primary-constructors

class S {
  int s;
  S(this.s);
}

class C(super.s) extends S {
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  this : super(0);
}

main() {
  print(C);
}
