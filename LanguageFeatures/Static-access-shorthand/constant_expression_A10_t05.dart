// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A static member shorthand expression should be a potentially
/// constant expression if the corresponding explicit static member plus
/// selectors expression would be, which currently means that it's a potentially
/// constant expression if and only if it's a constant expression.
///
/// @description Checks that it is a compile-time error to use a non-constant
/// static member shorthand expression in a constant list literal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C {
  static C answer = const C(42);
  final int v;
  const C(this.v);
}

mixin M on C {
  static M answer = const MC(42);
}

class MC extends C with M {
  const MC(super.v);
}

enum E {
  e0;
  static E answer = E.e0;
}

extension type const ET(int v) {
  static ET answer = const ET(42);
}

main() {
  print(const <C>[.answer]);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  print(const <M>[.answer]);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  print(const <E>[.answer]);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  print(const <ET>[.answer]);
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}
