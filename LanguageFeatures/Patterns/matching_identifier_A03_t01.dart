// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At runtime, a pattern is matched against a value. This determines
/// whether or not the match fails and the pattern refutes the value. If the
/// match succeeds, the pattern may also destructure data from the object or
/// bind variables.
///
/// Refutable patterns usually occur in a context where match refutation causes
/// execution to skip over the body of code where any variables bound by the
/// pattern are in scope. If a pattern match failure occurs in an irrefutable
/// context, a runtime error is thrown.
///
/// To match a pattern p against a value v:
/// ...
/// Identifier:
/// i. In a matching context, the same as a constant pattern whose constant
///   expression is the identifier.
/// ii. Else, the same as a variable pattern with the same identifier.
///
/// @description Checks that in an irrefutable context if runtime type of `v` is
/// a subtype of `T`, where T` is the static type of `v`, then the match
/// succeeds and `v` is stored in `p`s variable
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

main() {
  int v1 = 0;
  <dynamic>[v1] = [42] as dynamic;
  Expect.equals(42, v1);

  int? v2 = 0;
  <dynamic>[v2] = [null] as dynamic;
  Expect.isNull(v2);

  num v3 = 0;
  <dynamic>[v3] = [3.14] as dynamic;
  Expect.equals(3.14, v3);
}
