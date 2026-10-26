// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a constructor declaration in an extension which declares a
/// named constructor with name `Name`, it is an error if `Name` is either the
/// name of the extension, or the on-declaration of the extension
///
/// @description Checks that it is a compile-time error if an extension declares
/// a redirecting factory constructor whose name is the name of the
/// on-declaration of the extension. Test on-types denoted by identifiers with
/// an import prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'constructor_A04_lib.dart' as p;

extension ExtC on p.C {
  factory C() = p.C.someName;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM on p.M {
  factory M() = p.MO.new;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC on p.MC {
  factory MC() = p.MC.someName;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET on p.ET {
  factory ET(int v) = p.ET.someName;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtG<T> on p.G<T> {
  factory G() = p.G<T>.someName;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtCC on p.CC {
  const factory CC() = p.CC.someName;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

// No enum type here we because can't have a redirecting constructor whose
// return type is an enumerated type

main() {
  print(p.C);
  print(p.M);
  print(p.MC);
  print(p.ET);
  print(p.G);
  print(p.CC);
}
