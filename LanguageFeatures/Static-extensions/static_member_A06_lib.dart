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
/// @description Library containing declarations and extensions with static
/// members. Used by the tests that check static member invocations of the form
/// `prefix.C.m`.
/// @author sgrekhov22@gmail.com

class C {}

mixin M {}

mixin class MC {}

enum E {
  e0;
}

extension type ET(int _) {}

extension ExtC on C {
  static String v = "ExtC.v";
  static String get g => "ExtC.g";
  static set s(String value) {
    v = value;
  }
  static String m([String s = ""]) => "ExtC.m($s)";
}

extension ExtM on M {
  static String v = "ExtM.v";
  static String get g => "ExtM.g";
  static set s(String value) {
    v = value;
  }
  static String m([String s = ""]) => "ExtM.m($s)";
}

extension ExtMC on MC {
  static String v = "ExtMC.v";
  static String get g => "ExtMC.g";
  static set s(String value) {
    v = value;
  }
  static String m([String s = ""]) => "ExtMC.m($s)";
}

extension ExtE on E {
  static String v = "ExtE.v";
  static String get g => "ExtE.g";
  static set s(String value) {
    v = value;
  }
  static String m([String s = ""]) => "ExtE.m($s)";
}

extension ExtET on ET {
  static String v = "ExtET.v";
  static String get g => "ExtET.g";
  static set s(String value) {
    v = value;
  }
  static String m([String s = ""]) => "ExtET.m($s)";
}

extension ExtC1 on C {
  static String amb() => "ExtC1.amb()";
  static String get ambGetter => "ExtC1.ambGetter";
  static String ambVar = "ExtC1.ambVar";
}

extension ExtC2 on C {
  static String amb() => "ExtC2.amb()";
}

extension ExtM1 on M {
  static String amb() => "ExtM1.amb()";
  static String get ambGetter => "ExtM1.ambGetter";
  static String ambVar = "ExtM1.ambVar";
}

extension ExtM2 on M {
  static String amb() => "ExtM2.amb()";
}

extension ExtMC1 on MC {
  static String amb() => "ExtMC1.amb()";
  static String get ambGetter => "ExtMC1.ambGetter";
  static String ambVar = "ExtMC1.ambVar";
}

extension ExtMC2 on MC {
  static String amb() => "ExtMC2.amb()";
}

extension ExtE1 on E {
  static String amb() => "ExtE1.amb()";
  static String get ambGetter => "ExtE1.ambGetter";
  static String ambVar = "ExtE1.ambVar";
}

extension ExtE2 on E {
  static String amb() => "ExtE2.amb()";
}

extension ExtET1 on ET {
  static String amb() => "ExtET1.amb()";
  static String get ambGetter => "ExtET1.ambGetter";
  static String ambVar = "ExtET1.ambVar";
}

extension ExtET2 on ET {
  static String amb() => "ExtET2.amb()";
}
