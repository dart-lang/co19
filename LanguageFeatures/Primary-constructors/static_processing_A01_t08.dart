// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` or `factory` as a keyword and omitting
/// the class name in declarations of ordinary (non-primary) constructors is
/// purely syntactic. The static analysis and meaning of such constructors is
/// identical to the form that uses the class name.
///
/// @description Check that it is a syntax error to declare a `factory new`
/// constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C1 {
  final int v;
  const C1.create(int v) : v = v;
  const factory new(int v) = C1.create;
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  final int v;
  C2.someName(this.v);
  factory new(int v) => C2.someName(v);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

}

extension type ET1.create(int v) {
  const factory new(int v) = ET1.create;
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2.create(int v) {
  factory new(int v) => ET2.create(v);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(ET1);
  print(ET2);
}
