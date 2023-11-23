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
/// @description Checks that equality of the record types
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

typedef T1 = ({String s, int i});
typedef T2 = ({int i, String s});
typedef T3 = (String, int);
typedef T4 = (String s, int j);
typedef T5 = (String x, int i,);

main() {
  Expect.isTrue(T1 == T2);
  Expect.isTrue(T3 == T4);
  Expect.isTrue(T4 == T5);
  Expect.isTrue(T3 == T5);
}
