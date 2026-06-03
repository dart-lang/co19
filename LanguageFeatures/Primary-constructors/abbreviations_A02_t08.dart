// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that it is still a compile-time error if a generative
/// constructor of an enum is used as a target of a factory redirection.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

enum E1 {
  e0;

  const E1();
  factory name() = E1.new;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0.name();

  const E2.name();
  const factory() = E2.name;
//                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
}
