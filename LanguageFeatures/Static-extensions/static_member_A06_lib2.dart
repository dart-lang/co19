// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In the following, we assume that `C` denotes a type introducing
/// membered declaration `D` (that is, a class, a mixin class, a mixin, an enum,
/// or an extension type declaration). `C` may be a type identifier, or it may
/// be of the form `prefix.id` where `prefix` and `id` are type identifiers,
/// `prefix` denotes an import prefix, and `id` denotes said type introducing
/// membered declaration in the namespace of that prefix.
///
/// @description Library containing extensions with static members which have the
/// same names as static members of extensions declared in
/// `static_member_A06_lib.dart`. Used by the tests that check static member
/// invocations of the form `prefix.C.m`.
/// @author sgrekhov22@gmail.com

import 'static_member_A06_lib.dart';

extension ExtC on C {
  static String ambVar = "lib2 ExtC.ambVar";
}

extension ExtM on M {
  static String ambVar = "lib2 ExtM.ambVar";
}

extension ExtMC on MC {
  static String ambVar = "lib2 ExtMC.ambVar";
}

extension ExtE on E {
  static String ambVar = "lib2 ExtE.ambVar";
}

extension ExtET on ET {
  static String ambVar = "lib2 ExtET.ambVar";
}
