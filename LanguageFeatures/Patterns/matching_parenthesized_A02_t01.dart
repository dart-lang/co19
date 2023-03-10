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
/// Parenthesized: Match the subpattern against v and succeed if it matches.
///
/// @description Checks that if the subpattern of a parenthesized pattern
/// doesn't match, then the pattern itself doesn't match too
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  Expect.throws(() {
    int v = 42;
    (<dynamic>[v]) = ["42"] as dynamic;
  });
  Expect.throws(() {
    String v = "42";
    (<dynamic>[v]) = [42] as dynamic;
  });
  Expect.throws(() {
    int v = 0;
    (<dynamic>[v]) = [null] as dynamic;
  });
}
