// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Two objects T1 and T2 which are instances of Type (that is,
/// runtime type objects) are considered equal if and only if the runtime type
/// objects T1 and T2 corresponds to the types S1 and S2 respectively, and the
/// normal forms NORM(S1) and NORM(S2) are syntactically equal up to equivalence
/// of bound variables and ignoring * modifiers on types.
///
/// @description Checks that runtime type of objects T1 and T2 are equal if and
/// only if the runtime type objects T1 and T2 corresponds to the types S1 and S2
/// respectively, and the normal forms NORM(S1) and NORM(S2) are syntactically
/// equal
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "../../../Utils/expect.dart";
import "legacy_lib.dart";

main() {
  var v1 = getInt();
  int v2 = 0;
  Expect.equals(v1.runtimeType, v2.runtimeType);

  var v3 = getType<int?>(42);
  int? v4 = 0;
  Expect.equals(v3.runtimeType, v4.runtimeType);
  v4 = null;
  Expect.notEquals(v3.runtimeType, v4.runtimeType);
  v3 = null;
  Expect.equals(v3.runtimeType, v4.runtimeType);

  var v5 = getType<int>(42);
  int v6 = 0;
  Expect.equals(v5.runtimeType, v6.runtimeType);

  var v7 = getType<dynamic>(42);
  dynamic v8 = 0;
  Expect.equals(v7.runtimeType, v8.runtimeType);
}
