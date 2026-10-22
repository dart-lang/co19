// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a constructor declaration in an extension which declares a
/// named constructor with name `Name`, it is an error if `Name` is either the
/// name of the extension, or the on-declaration of the extension
///
/// @description Checks that it is a compile-time error if an extension declares
/// a redirecting factory constructor whose name is the name of the
/// on-declaration of the extension. Test on-types denoted by type aliases.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C {
  C.someName();
}

typedef CAlias = C;

extension ExtC on CAlias {
  factory C() = C.someName;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {}

typedef MAlias = M;

extension ExtM on MAlias {
  factory M() = MO.new;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

class MO = Object with M;

mixin class MC {
  MC.someName();
}

typedef MCAlias = MC;

extension ExtMC on MCAlias {
  factory MC() = MC.someName;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
}

extension type ET.someName(int _) {}

typedef ETAlias = ET;

extension ExtET on ETAlias {
  factory ET(int v) = ET.someName;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class G<T> {
  G.someName();
}

typedef GAlias<T> = G<T>;

extension ExtG<T> on GAlias<T> {
  factory G() = G<T>.someName;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

class CC {
  const CC.someName();
}

typedef CCAlias = CC;

extension ExtCC on CCAlias {
  const factory CC() = CC.someName;
//              ^^
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
  print(CC);
}
