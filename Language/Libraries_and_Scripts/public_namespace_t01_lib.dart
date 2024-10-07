// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The public namespace of library L is the mapping that maps the
/// simple name of each public top level member m of L to m. The scope of a
/// library L consists of the names introduced by all top level declarations
/// declared in L, and the names added by L's imports.
///
/// @description Checks that the scope of a library L consist of the names
/// introduced by all top level declaration in L, and the names added by L's
/// import.
/// @author vasya

import "../../Utils/expect.dart";

part "public_namespace_t01_p1_lib.dart";
part "public_namespace_t01_p2_lib.dart";

final L_variable = 0;

L_func() {
  return 0;
}

class LClass {
  var field = 0;
  func() => 0;
}

abstract class LInterface {
  static final i = 0;
}

test() {
  Expect.equals(0, L_variable);
  Expect.equals(0, L_func());
  Expect.equals(0, new LClass().field);
  Expect.equals(0, new LClass().func());
  Expect.equals(0, LInterface.i);

  Expect.equals(1, L1_func());
  Expect.equals(1, L1_variable);

  Expect.equals(2, new L2Class().field);
  Expect.equals(2, new L2Class().func());
  Expect.equals(2, L2Interface.i);
}
