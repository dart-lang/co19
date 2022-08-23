// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define shape to mean the number of positional fields (the
/// record's arity) and the set of names of its named fields. Record types are
/// structural, not nominal. Records produced in unrelated libraries have the
/// exact same static type if they have the same shape and their corresponding
/// fields have the same types.
///
/// The order of named fields is not significant. The record types {int a,
/// int b} and {int b, int a} are identical to the type system and the runtime.
/// (Tools may or may not display them to users in a canonical form similar to
/// how they handle function typedefs.)
///
/// @description Checks that records produced in unrelated libraries have the
/// exact same static type if they have the same shape and their corresponding
/// fields have the same types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "static_semantics_A02_01.lib.dart" as lib;
import "../../Utils/expect.dart";

typedef R1 = (int, String);
typedef R2 = (int i, {String s});
typedef R3 = ({int i, String s});

main() {
  R1 r1 = lib.t1;
  R2 r2 = lib.t2;
  R3 r3 = lib.t3;

  lib.T1 l1 = r1;
  lib.T2 l2 = r2;
  lib.T3 l3 = r3;

  Expect.isTrue(r1 is lib.T1);
  Expect.isTrue(r2 is lib.T2);
  Expect.isTrue(r3 is lib.T3);
  Expect.isTrue(lib.t1 is R1);
  Expect.isTrue(lib.t2 is R2);
  Expect.isTrue(lib.t3 is R3);
}