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
/// identifier with an import prefix. Test methods, getters, setters and
/// variables, and conflicts between extensions imported from the same library,
/// imported from different libraries, declared locally, and between an imported
/// extension and a local one.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import 'static_member_A06_lib.dart' as p;
import 'static_member_A06_lib2.dart' as q;

extension LocalC1 on p.C {
  static String get ambGetter => "LocalC1.ambGetter";
  static set ambSetter(String _) {}
}

extension LocalC2 on p.C {
  static set ambSetter(String _) {}
}

extension LocalM1 on p.M {
  static String get ambGetter => "LocalM1.ambGetter";
  static set ambSetter(String _) {}
}

extension LocalM2 on p.M {
  static set ambSetter(String _) {}
}

extension LocalMC1 on p.MC {
  static String get ambGetter => "LocalMC1.ambGetter";
  static set ambSetter(String _) {}
}

extension LocalMC2 on p.MC {
  static set ambSetter(String _) {}
}

extension LocalE1 on p.E {
  static String get ambGetter => "LocalE1.ambGetter";
  static set ambSetter(String _) {}
}

extension LocalE2 on p.E {
  static set ambSetter(String _) {}
}

extension LocalET1 on p.ET {
  static String get ambGetter => "LocalET1.ambGetter";
  static set ambSetter(String _) {}
}

extension LocalET2 on p.ET {
  static set ambSetter(String _) {}
}

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

  // Extensions imported from the same library
  p.C.amb();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  // An imported extension and a local one
  p.C.ambGetter;
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // Local extensions
  p.C.ambSetter = "";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // Extensions imported from different libraries
  p.C.ambVar;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.C.ambVar = "";
//    ^^^^^^
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

  // Extensions imported from the same library
  p.M.amb();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  // An imported extension and a local one
  p.M.ambGetter;
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // Local extensions
  p.M.ambSetter = "";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // Extensions imported from different libraries
  p.M.ambVar;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.M.ambVar = "";
//    ^^^^^^
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

  // Extensions imported from the same library
  p.MC.amb();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  // An imported extension and a local one
  p.MC.ambGetter;
//     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // Local extensions
  p.MC.ambSetter = "";
//     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // Extensions imported from different libraries
  p.MC.ambVar;
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.MC.ambVar = "";
//     ^^^^^^
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

  // Extensions imported from the same library
  p.E.amb();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  // An imported extension and a local one
  p.E.ambGetter;
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // Local extensions
  p.E.ambSetter = "";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // Extensions imported from different libraries
  p.E.ambVar;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.E.ambVar = "";
//    ^^^^^^
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

  // Extensions imported from the same library
  p.ET.amb();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  // An imported extension and a local one
  p.ET.ambGetter;
//     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // Local extensions
  p.ET.ambSetter = "";
//     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // Extensions imported from different libraries
  p.ET.ambVar;
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  p.ET.ambVar = "";
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // No conflict here
  print(q.ExtC.ambVar);
  print(q.ExtM.ambVar);
  print(q.ExtMC.ambVar);
  print(q.ExtE.ambVar);
  print(q.ExtET.ambVar);
}
