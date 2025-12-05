// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// ...
/// If there is no error then:
/// - The parameter name of the parameter in the constructor is the public name
///   `n`. This means that the parameter has a public name in the constructor's
///   function signature, and arguments for this parameter are given using the
///   public name. All uses of the constructor, outside of its own code, see
///   only the public name.
///
/// @description Check that the name of the parameter in the constructor
/// signature is the corresponding public name `n`. Test primary constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters,primary-constructors

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C1({var String? _p});

class C2({required final String _p});

enum E1({final String? _p}) {
  e0(p: "E1");
}

enum E2({required final String _p}) {
  e0(p: "E2");
}

main() {
  C1.new.expectStaticType<Exactly<C1 Function({String? p})>>();
  C2.new.expectStaticType<Exactly<C2 Function({required String p})>>();
  Expect.equals("E1", E1.e0._p);
  Expect.equals("E2", E2.e0._p);
}
