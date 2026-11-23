// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In the case where `D` does not declare any static members whose
/// basename is the basename of `m`, and `D` does not declare any constructors
/// named `C.m2` where `m2` is the basename of `m`, let `M` be the set
/// containing each accessible extension whose on-declaration is `D`, and whose
/// static members include one with the name `m`, or which declares a
/// constructor named `C.m`.
/// ...
/// An error occurs if `M` is empty, or `M` contains more than one member.
///
/// @description Checks that it is a compile-time error if `M` is empty because
/// all extensions which declare a static member named `m` are not accessible.
/// Test that extensions which are not exported by an imported library are not
/// accessible.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'static_member_A07_lib.dart';

main() {
  C.foo("1");
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M.foo("1");
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC.foo("1");
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.foo();
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.foo("1");
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
