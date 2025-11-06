// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` rather than the class name in
/// declarations of ordinary (non-declaring) constructors is purely syntactic.
/// The static analysis and meaning of such constructors is identical to the
/// form that uses the class name.
///
/// @description Check that it is a compile-time error to declare a
/// `factory new` constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C1 {
  final int v;
  const new(int v) : v = v;
  const factory new.someName(int v) = C1;
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  final int v;
  new.someName(this.v);
  factory new(int v) => C2.someName(v);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

}

extension type ET1._(int v) {
  const new(int v) : v = v;
  const factory new.someName(int v) = ET1;
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(int v) {
  new.someName(this.v);
  factory new(int v) => ET2.someName(v);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
}
