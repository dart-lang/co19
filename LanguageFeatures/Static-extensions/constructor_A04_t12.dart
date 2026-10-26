// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a constructor declaration in an extension which declares a
/// named constructor with name `Name`, it is an error if `Name` is either the
/// name of the extension, or the on-declaration of the extension
///
/// @description Checks that it is a compile-time error if an extension declares
/// a factory constructor whose name is the name of the on-declaration of the
/// extension. Test on-types denoted by type aliases with an import prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'constructor_A04_lib.dart' as p;

extension ExtCAlias on p.CAlias {
  factory C() => p.C.someName();
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMAlias on p.MAlias {
  factory M() => p.MO();
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMCAlias on p.MCAlias {
  factory MC() => p.MC.someName();
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtEAlias on p.EAlias {
  factory E() => p.E.e0;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtETAlias on p.ETAlias {
  factory ET(int v) => p.ET.someName(v);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtGAlias<T> on p.GAlias<T> {
  factory G() => p.G<T>.someName();
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(p.C);
  print(p.M);
  print(p.MC);
  print(p.E);
  print(p.ET);
  print(p.G);
}
