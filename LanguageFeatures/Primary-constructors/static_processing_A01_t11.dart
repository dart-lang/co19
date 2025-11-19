// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` or `factory` as a keyword and omitting
/// the class name in declarations of ordinary (non-primary) constructors is
/// purely syntactic. The static analysis and meaning of such constructors is
/// identical to the form that uses the class name.
///
/// @description Check that it is a syntax error to use `factory` instead of the
/// class name in declarations of named constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C {
  const C();
  factory.someName1() = C;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const factory.someName2() => C();
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory.someName3() = C;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const factory.someName4() => C();
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET(int v) {
  factory.someName1(int v) = ET.new;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const factory.someName2(int v) = ET.new;
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory.someName3(int v) => ET(v);
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const factory.someName2(int v) => ET(v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
