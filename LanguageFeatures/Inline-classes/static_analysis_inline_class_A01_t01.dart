// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The unique instance variable declared by an inline class must
/// have a type annotation.
///
/// @description Checks that it is a compile-time error if an instance variable
/// of the inline class has no type annotation
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class IC1 {
  final id;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  IC1(this.id);
}

inline class IC2 {
  final id = 42;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  IC1 ic1 = IC1(42);
  IC2 ic2 = IC2();
}
