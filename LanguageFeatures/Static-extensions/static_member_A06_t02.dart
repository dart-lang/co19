// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In the following, we assume that `C` denotes a type introducing
/// membered declaration `D` (that is, a class, a mixin class, a mixin, an enum,
/// or an extension type declaration). `C` may be a type identifier, or it may
/// be of the form `prefix.id` where `prefix` and `id` are type identifiers,
/// `prefix` denotes an import prefix, and `id` denotes said type introducing
/// membered declaration in the namespace of that prefix.
/// ...
/// In the case where `D` does not declare any static members whose basename is
/// the basename of `m`, and `D` does not declare any constructors named `C.m2`
/// where `m2` is the basename of `m`, let `M` be the set containing each
/// accessible extension whose on-declaration is `D`, and whose static members
/// include one with the name `m`, or which declares a constructor named `C.m`.
/// ...
/// An error occurs if `M` is empty, or `M` contains more than one member.
///
/// @description Checks that it is a compile-time error if `M` is empty or
/// contains more than one member and the on-declaration is denoted by an
/// identifier with an import prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'static_member_A06_lib.dart' as p;

main() {
  p.C.missing();
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C.missingGetter;
//    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C.missingSetter = "";
//    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C.amb();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M.missing();
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M.missingGetter;
//    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M.missingSetter = "";
//    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M.amb();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC.missing();
//     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC.missingGetter;
//     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC.missingSetter = "";
//     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC.amb();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E.missing();
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E.missingGetter;
//    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E.missingSetter = "";
//    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E.amb();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET.missing();
//     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET.missingGetter;
//     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET.missingSetter = "";
//     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET.amb();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
