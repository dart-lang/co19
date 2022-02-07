// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of such an enum declaration, E, is defined as
/// introducing a (semantic) class, C, just like a similar class declaration.
/// ...
/// Default constructor: If no generative constructors were declared, and no
/// unnamed factory constructor was added, a default generative constructor is
/// added:
///
/// const Name();
/// (This differs from the default constructor of a normal class declaration by
/// being constant, and by being added even if a factory constructor is present.
/// If no generative constructor is declared, and the unnamed constructor is
/// taken by a factory constructor, there is no way for the enum declaration to
/// compile successfully, since the declaration must contain at least one enum
/// value, and that enum value must refer to a generative constructor.)
///
/// @description Check that if a generative constructors was declared then a
/// default generative constructor is not added
/// @Issue 48179, 48181
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
  e1,
//^^
// [analyzer] unspecified
// [cfe] unspecified
  e2;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  const E1.n(int i) {}
}

enum E2 {
  e1(),
//^^
// [analyzer] unspecified
// [cfe] unspecified
  e2.n(1),
  e3.n(1);

  const E2.n(int i) {}
}

main() {
  print(E1.e1);
  print(E2.e1);
}
