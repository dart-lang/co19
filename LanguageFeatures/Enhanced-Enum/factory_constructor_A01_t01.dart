// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the constructor implicitly invoked
/// by an enumerated enum value declaration is a factory constructor.
///
/// @description Check that it is a compile-time error if the constructor
/// implicitly invoked by an enumerated enum value declaration is a factory
/// constructor
/// @author sgrekhov22@gmail.com

enum E1 {
  e1,
  e2.foo();
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
  const E1();
  const factory E1.foo() = ET1.foo;
}

extension type const ET1(E1 it) implements E1 {
  const ET1.foo() : this(E1.e1);
}

void main() {
  print(identical(E1.e1, E1.e2));
}
