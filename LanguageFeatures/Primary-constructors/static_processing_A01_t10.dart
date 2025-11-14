// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` or `factory` as a keyword and omitting
/// the class name in declarations of ordinary (non-primary) constructors is
/// purely syntactic. The static analysis and meaning of such constructors is
/// identical to the form that uses the class name.
///
/// @description Check that it is a syntax error to use `new` instead of the
/// class name in declarations of named constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C1 {
  new.someName();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  final int v;
  const new.someName(int v) : v = v;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1._(int v) {
  new.someName(this.v);
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(int v) {
  const new.someName() : v = -2;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  const E();
  const new.someName();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(ET1);
  print(ET2);
  print(E);
}
