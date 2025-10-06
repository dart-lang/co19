// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, enum, or extension type
/// has a primary constructor whose name is also the name of a constructor
/// declared in the body.
///
/// @description Check that it is a compile-time error if a class has a primary
/// constructor whose name is also the name of a constructor declared in the
/// body.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

class C1(var int v) {
  C1(this.v);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(final int v) {
  C2.new(int v);
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3.someName(var int v) {
  C3.someName();
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4._() {
  C4._(int v);
//   ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
}
