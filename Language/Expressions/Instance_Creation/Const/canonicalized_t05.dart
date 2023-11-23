// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluation of e proceeds as follows:
/// First, if e is of the form
/// const T.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k) then let i be the
/// value of the expression new T.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
/// Otherwise, e must be of the form
/// const T(a1, ..., an, xn+1: an+1, ..., xn+k: an+k), in which case let i be
/// the result of evaluating new T(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
/// Then:
/// • If during execution of the program, a constant object expression has
///   already evaluated to an instance j of class R with type arguments Vi,
///   1 <= i <= m, then:
///   – For each instance variable f of i, let vif be the value of the field f
///     in i, and let vjf be the value of the field f in j.
///     If identical(vif, vjf ) for all fields f in i, then the value of e is j,
///     otherwise the value of e is i.
/// • Otherwise the value of e is i.
/// In other words, constant objects are canonicalized.
/// @description Checks that equal strings constructed at compile-time are
/// canonicalized.
/// @Issue https://github.com/dart-lang/language/issues/985
/// @author iefremov

import '../../../../Utils/expect.dart';


main() {
  const s1 = "Alea iacta est";
  const s2 = "Alea iacta est";
  Expect.isTrue(identical(s1, s2));

  const s3 = "Si finis bonus est," " totum bonum erit";
  const s4 = "Si finis " "bonus est, totum " "bonum erit";
  Expect.isTrue(identical(s3, s4));

  var v1 = "Alea iacta est";
  var v2 = "Alea iacta est";
  Expect.isTrue(identical(v1, v2));

  var v3 = "Si finis bonus est," " totum bonum erit";
  var v4 = "Si finis " "bonus est, totum " "bonum erit";
  // The specification actually requires `identical(v3, v4)` to evaluate to true.
  // However, we have known for several years that this is not how the tools
  // actually behave, see https://github.com/dart-lang/language/issues/985 for
  // more details.
  Expect.isTrue(identical(v3, v4));
}
