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
/// @description Checks that records with the same shape can be assigned to each
/// other. Check records with positional fields only
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

typedef T1 = (int, String);
typedef T2 = (int i, String s);
typedef T3 = (int j, String st);

main() {
  T1 t1 = (42, "Lily was here");
  T2 t2 = (0, "");
  T3 t3 = (1, "Hello");
  Expect.isTrue(t1 is T2);
  Expect.isTrue(t1 is T3);
  Expect.isTrue(t2 is T1);
  Expect.isTrue(t2 is T3);
  Expect.isTrue(t3 is T1);
  Expect.isTrue(t3 is T2);
  T1 r1 = t2;
  r1 = t3;
  T2 r2 = t1;
  r2 = t3;
  T3 r3 = t1;
  r3 = t2;
}
