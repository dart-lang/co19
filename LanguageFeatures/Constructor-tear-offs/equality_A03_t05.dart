// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
///
/// @description Checks that the equality properties of any function object
/// obtained by generic function instantiation is determined by the equality of
/// the source function objects
/// @author sgrekhov@unipro.ru
/// @issue 47317

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

main() {
  X localFunction1<X>(X x) => x;
  X localFunction2<X>(X x) => x;
  <X>() {
    var f1_1 = localFunction1;
    var f1_2 = localFunction1;

    var f1_3 = localFunction1<X>;
    var f1_4 = localFunction1<X>;
    X Function(X) f1_5 = localFunction1;
    var f2 = localFunction2<X>;

    Expect.equals(f1_1 == f1_2, f1_3 == f1_4);
    Expect.equals(f1_1 == f1_2, f1_3 == f1_5);
    Expect.notEquals(f1_3, f2);
    Expect.notEquals(f1_4, f2);
    Expect.notEquals(f1_5, f2);
  }<int>();
}
