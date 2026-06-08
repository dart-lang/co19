// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a final instance variable whose
/// declaration has an initializer expression is also initialized by a
/// constructor, either by an initializing formal or an initializer list entry.
///
/// @description Checks that a compile error occurs if a final instance variable
/// that has been initialized in declaration is also initialized by a primary
/// constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C() {
  final v = 1;
  this : v = 2 {}
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E() {
  e0;
  final v = 1;
  this : v = 2;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
}
