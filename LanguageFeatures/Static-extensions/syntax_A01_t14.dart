// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, in an extension declaration that has an on-declaration.
///
/// Such declarations may of course give rise to errors as usual, e.g., if a
/// redirecting factory constructor redirects to a constructor that does not
/// exist, or there is a redirection cycle.
///
/// @description Checks that that it is a compile-time error if redirecting
/// factory constructors in an extension have a redirection cycle.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C.other() {}

mixin class MC.other() {}

extension type ET.other(int id) implements num {}

extension ExtC1 on C {
  factory() = C.new;
//            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtC2 on C {
  factory someName() = C.someName;
//                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtC3 on C {
  factory foo() = C.bar;
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory bar() = C.foo;
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC1 on MC {
  factory() = MC.new;
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC2 on MC {
  factory someName() = MC.someName;
//                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC3 on MC {
  factory foo() = MC2.bar;
//                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory bar() = MC2.foo;
//                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET1 on ET {
  factory() = ET.new;
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET2 on ET {
  factory someName() = ET.someName;
//                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET3 on ET {
  factory foo() = ET.bar;
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory bar() = ET.foo;
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(MC);
  print(ET);
}
