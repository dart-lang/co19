// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// ...
/// If there is no error then:
/// ...
/// - The instance variable initialized by the parameter (and declared by it, if
///   the parameter is a field parameter), has the private name `p`.
///
/// @description Check that the instance variable initialized by the
/// initializing formal parameter has the private name `p`. Test primary
/// constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters,primary-constructors

import '../../Utils/expect.dart';

class C1({var String _p = "_p"});

class C2({required final String _p});

enum E1({final String _p = "_p"}) {
  e0, e1(p: "E1");
}

enum E2this({required final String _p}) {
  e0(p: "E2");
}

main() {
  Expect.equals("_p", C1()._p);
  Expect.equals("one", C1(p: "one")._p);
  Expect.equals("two", C2(p: "two")._p);

  Expect.equals("_p", E1.e0._p);
  Expect.equals("E1", E1.e1._p);
  Expect.equals("E2", E2.e0._p);
}
