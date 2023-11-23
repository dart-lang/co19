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
/// Variable:
/// i. Let T be the static type of the variable p declares or assigns to.
/// ii. If the runtime type of v is not a subtype of T then the match fails.
/// iii. Otherwise, store v in p's variable and the match succeeds.
///
/// @description Checks that if the runtime type of `v` is a subtype of the
/// static type of the variable `p` declares or assigns to, then `v` is stored
/// in `p`s variable and match succeeds. Test an irrefutable context
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

main() {
  var <dynamic>[int v1] = [42] as dynamic;
  Expect.equals(42, v1);

  final <dynamic>[num? v2] = [null] as dynamic;
  Expect.isNull(v2);

  var <dynamic>[num v3] = [3.14] as dynamic;
  Expect.equals(3.14, v3);

  final <dynamic>[num v4] = [42] as dynamic;
  Expect.equals(42, v4);
}
