// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The expression () refers to the constant empty record with no
/// fields.
///
/// @description Checks that the expression () refers to the constant empty
/// record with no fields.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

Record foo1() => ();
() foo2() => ();

Record bar1(Record r) => r;
() bar2(() r) => r;

main() {
  var record1 = ();
  Expect.equals((), record1);
  Expect.equals((), foo1());
  Expect.equals((), foo2());
  Expect.equals((), bar1(()));
  Expect.equals((), bar2(()));

  var record2 = ((), n: ());
  Expect.equals((), record2.$0);
  Expect.equals((), record2.n);

  Expect.notEquals((), ((),));
}
