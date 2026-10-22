// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a constructor declaration in an extension which declares a
/// named constructor with name `Name`, it is an error if `Name` is either the
/// name of the extension, or the on-declaration of the extension
///
/// @description Checks that it is a compile-time error if an extension declares
/// a factory constructor whose name is the name of the extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C {
  C.someName();
}

extension ExtC on C {
  factory ExtC() => C.someName();
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {}

extension ExtM on M {
  factory ExtM() => MO();
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class MO = Object with M;

mixin class MC {
  MC.someName();
}

extension ExtMC on MC {
  factory ExtMC() => MC.someName();
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
}

extension ExtE on E {
  factory ExtE() => E.e0;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET.someName(int _) {}

extension ExtET on ET {
  factory ExtET(int v) => ET.someName(v);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class G<T> {
  G.someName();
}

extension ExtG<T> on G<T> {
  factory ExtG() => G<T>.someName();
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtRecord on Record {
  factory ExtRecord() => ();
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtFunction on Function {
  factory ExtFunction() => () {};
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(MC);
  print(E);
  print(ET);
  print(G);
}
