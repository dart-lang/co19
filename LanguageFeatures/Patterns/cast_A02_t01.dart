// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion castPattern ::= primaryPattern 'as' type
///
/// A cast pattern is similar to an extractor pattern in that it checks the
/// matched value against a given type. But where an extractor pattern is
/// refuted if the value doesn't have that type, a cast pattern throws. Like the
/// null-assert pattern, this lets you forcibly assert the expected type of some
/// destructured value.
///
/// @description Check that cast pattern throws if the value doesn't have an
/// expected type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  (num, Object) r1 = (1, 2);
  Expect.throws(() {
    var (i as int, s as String) = r1;
  });

  (Record,) r2 = ((3.14, name: "pi"),);
  Expect.throws(() {
    var (rec1 as (),) = r2;
  });

  ({num n, Object o}) r3 = (n: 1, o: 2);
  Expect.throws(() {
    var (n: n as int, o: o as String) = r3;
  });

  ({Record r}) r4 = (r: (1, 2));
  Expect.throws(() {
    var (r: rec1 as ()) = r4;
  });
}
