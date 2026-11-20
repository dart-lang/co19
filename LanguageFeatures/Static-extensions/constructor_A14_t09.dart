// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `M` be the set of accessible extensions with on-declaration
/// `D` that declare a constructor with uniform base constructor name `name` or
/// a static member with basename `name`.
/// ...
/// Otherwise, `M` only includes extensions containing constructors with the
/// requested name. A compile-time error occurs if `M` is empty, or `M` contains
/// two or more elements. Otherwise, the invocation or reference denotes an
/// invocation of or reference to the constructor with uniform base constructor
/// name `name` which is declared by the extension declaration that `M`
/// contains.
///
/// @description Checks that it is a compile-time error if `C` denotes an
/// on-declaration with an import prefix and `M` is empty, contains two or more
/// elements, or includes extensions with constructors as well as static
/// members.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'constructor_A14_lib.dart' as p;

main() {
  p.C.missing("1");
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C<int>.missing("1");
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C.missing;
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C<int>.missing;
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C.amb();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C<int>.amb();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C.amb;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C<int>.amb;
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C.conflict();
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C<int>.conflict();
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C.conflict;
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C<int>.conflict;
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M.missing("1");
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M<int>.missing("1");
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M.missing;
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M<int>.missing;
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M.amb();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M<int>.amb();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M.amb;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M<int>.amb;
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M.conflict();
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M<int>.conflict();
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M.conflict;
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M<int>.conflict;
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC.missing("1");
//     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC<int>.missing("1");
//          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC.missing;
//     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC<int>.missing;
//          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC.amb();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC<int>.amb();
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC.amb;
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC<int>.amb;
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC.conflict();
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC<int>.conflict();
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC.conflict;
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC<int>.conflict;
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E.missing();
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E<int>.missing();
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E.missing;
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E<int>.missing;
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E.amb();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E<int>.amb();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E.amb;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E<int>.amb;
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E.conflict();
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E<int>.conflict();
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E.conflict;
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E<int>.conflict;
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET.missing("1");
//     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET<int>.missing("1");
//          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET.missing;
//     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET<int>.missing;
//          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET.amb();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET<int>.amb();
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET.amb;
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET<int>.amb;
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET.conflict();
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET<int>.conflict();
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET.conflict;
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET<int>.conflict;
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
