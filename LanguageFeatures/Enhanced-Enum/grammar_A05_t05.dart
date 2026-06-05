// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With a generative enum constructor that does not have the
/// modifier `const`, this modifier is implicitly induced. That is, `const` can
/// be omitted, but the constructor is constant anyway, and must satisfy all the
/// requirements of a generative `const` constructor.
///
/// @description Check that if the modifier `const` is omitted the constructor
/// is still a constant and therefore it is a compile-time error if it has a
/// body.
/// @author sgrekhov22@gmail.com

enum E {
  e1,
  e2,
  e3.name();

  E() {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  E.name() : this()  {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E);
}
