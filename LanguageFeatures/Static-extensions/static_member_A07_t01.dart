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
/// @description Checks that an extension which declares a static member named
/// `m` is not included in `M` if it is not accessible. Test extensions that are
/// declared in an imported library and are hidden by a `hide` combinator, have
/// a private name, or have no name. Test that in this case there is no
/// compile-time error and `C.m` refers to the static member declared in an
/// accessible extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import 'constructor_A12_lib.dart' hide ExtC2, ExtM2, ExtMC2, ExtE2, ExtET2;

extension ExtC1 on C {
  static String foo([String id = ""]) => "ExtC1.foo($id)";
}

extension ExtM1 on M {
  static String foo([String id = ""]) => "ExtM1.foo($id)";
}

extension ExtMC1 on MC {
  static String foo([String id = ""]) => "ExtMC1.foo($id)";
}

extension ExtE1 on E {
  static String foo([String id = ""]) => "ExtE1.foo($id)";
}

extension ExtET1 on ET {
  static String foo([String id = ""]) => "ExtET1.foo($id)";
}

main() {
  Expect.equals("ExtC1.foo(1)", C.foo("1"));
  Expect.identical(ExtC1.foo, C.foo);

  Expect.equals("ExtM1.foo(1)", M.foo("1"));
  Expect.identical(ExtM1.foo, M.foo);

  Expect.equals("ExtMC1.foo(1)", MC.foo("1"));
  Expect.identical(ExtMC1.foo, MC.foo);

  Expect.equals("ExtE1.foo(1)", E.foo("1"));
  Expect.identical(ExtE1.foo, E.foo);

  Expect.equals("ExtET1.foo(1)", ET.foo("1"));
  Expect.identical(ExtET1.foo, ET.foo);
}
