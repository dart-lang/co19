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
/// @description Checks that the order of named fields is not significant
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

typedef R1 = (int, bool, {String s, int i});
typedef R2 = (int x, bool b, {int i, String s});

main() {
  R1 r11 = (1, true, s: "r11", i: 11);
  R1 r12 = (i: 12, 2, s: "r12", false);
  R2 r21 = (s: "r21", i: 21, 3, true);
  R2 r22 = (4, i: 22, s: "r22", false);
  (int, bool, {String s, int i}) r3 = r12;

  Expect.isTrue(r11 is R2);
  Expect.isTrue(r12 is R2);
  Expect.isTrue(r21 is R1);
  Expect.isTrue(r22 is R1);
  Expect.isTrue(r3 is R1);
  Expect.isTrue(r3 is R2);
}
