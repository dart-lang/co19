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

// SharedOptions=--enable-experiment=inline-class

enum E {
  e1.foo();
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  const E();
  const factory E.foo() = ET.foo;
}

extension type const ET(E it) implements E {
  const ET.foo() : this(E.e1); //declaration of E.e1 has a cyclic dependency
//      ^^
// [analyzer] unspecified
}

void main() {
  print(E.e1);
}
