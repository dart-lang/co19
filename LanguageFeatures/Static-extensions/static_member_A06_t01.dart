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
/// Assume that it is an extension `E` that declares a static member named `m`.
/// The invocation is then treated as `E.m()`.
///
/// @description Checks that static members declared in extensions can be
/// accessed via an on-declaration denoted by an identifier with an import
/// prefix. Test static variables, getters, setters, methods and tearoffs. Test
/// also an extension whose on-type is denoted by an identifier with an import
/// prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import 'static_member_A06_lib.dart' as p;

extension LocalC on p.C {
  static String local() => "LocalC.local()";
}

extension LocalM on p.M {
  static String local() => "LocalM.local()";
}

extension LocalMC on p.MC {
  static String local() => "LocalMC.local()";
}

extension LocalE on p.E {
  static String local() => "LocalE.local()";
}

extension LocalET on p.ET {
  static String local() => "LocalET.local()";
}

main() {
  Expect.equals("ExtC.v", p.C.v);
  p.C.v = "C.v = 1";
  Expect.equals("C.v = 1", p.ExtC.v);
  p.C.s = "C.s = 2";
  Expect.equals("C.s = 2", p.C.v);
  Expect.equals("ExtC.g", p.C.g);
  Expect.equals("ExtC.m()", p.C.m());
  Expect.equals("ExtC.m(3)", p.C.m("3"));
  Expect.equals(p.ExtC.m, p.C.m);
  Expect.equals("LocalC.local()", p.C.local());
  Expect.equals("ExtC1.amb()", p.ExtC1.amb());

  Expect.equals("ExtM.v", p.M.v);
  p.M.v = "M.v = 1";
  Expect.equals("M.v = 1", p.ExtM.v);
  p.M.s = "M.s = 2";
  Expect.equals("M.s = 2", p.M.v);
  Expect.equals("ExtM.g", p.M.g);
  Expect.equals("ExtM.m()", p.M.m());
  Expect.equals("ExtM.m(3)", p.M.m("3"));
  Expect.equals(p.ExtM.m, p.M.m);
  Expect.equals("LocalM.local()", p.M.local());
  Expect.equals("ExtM1.amb()", p.ExtM1.amb());

  Expect.equals("ExtMC.v", p.MC.v);
  p.MC.v = "MC.v = 1";
  Expect.equals("MC.v = 1", p.ExtMC.v);
  p.MC.s = "MC.s = 2";
  Expect.equals("MC.s = 2", p.MC.v);
  Expect.equals("ExtMC.g", p.MC.g);
  Expect.equals("ExtMC.m()", p.MC.m());
  Expect.equals("ExtMC.m(3)", p.MC.m("3"));
  Expect.equals(p.ExtMC.m, p.MC.m);
  Expect.equals("LocalMC.local()", p.MC.local());
  Expect.equals("ExtMC1.amb()", p.ExtMC1.amb());

  Expect.equals("ExtE.v", p.E.v);
  p.E.v = "E.v = 1";
  Expect.equals("E.v = 1", p.ExtE.v);
  p.E.s = "E.s = 2";
  Expect.equals("E.s = 2", p.E.v);
  Expect.equals("ExtE.g", p.E.g);
  Expect.equals("ExtE.m()", p.E.m());
  Expect.equals("ExtE.m(3)", p.E.m("3"));
  Expect.equals(p.ExtE.m, p.E.m);
  Expect.equals("LocalE.local()", p.E.local());
  Expect.equals("ExtE1.amb()", p.ExtE1.amb());

  Expect.equals("ExtET.v", p.ET.v);
  p.ET.v = "ET.v = 1";
  Expect.equals("ET.v = 1", p.ExtET.v);
  p.ET.s = "ET.s = 2";
  Expect.equals("ET.s = 2", p.ET.v);
  Expect.equals("ExtET.g", p.ET.g);
  Expect.equals("ExtET.m()", p.ET.m());
  Expect.equals("ExtET.m(3)", p.ET.m("3"));
  Expect.equals(p.ExtET.m, p.ET.m);
  Expect.equals("LocalET.local()", p.ET.local());
  Expect.equals("ExtET1.amb()", p.ExtET1.amb());
}
