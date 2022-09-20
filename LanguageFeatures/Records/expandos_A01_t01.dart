// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Like numbers, records do not have a well-defined persistent
/// identity. That means [Expando]s can not be attached to them.
///
/// @description Checks that [Expando] cannot be attached to records
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

typedef R1 = (int, int i,);
typedef R2 = (num, {String name});
typedef R3 = ({double x, double y});

main() {
  R1 r1 = (1, 2);
  Expando<int> exp = Expando("C");
  Expect.throws(() {exp[r1] = 42;});

  R2 r2 = (3.14, name: "pi");
  Expect.throws(() {exp[r2] = 42;});

  R3 r3 = (x: 1.2, y: 3.4);
  Expect.throws(() {exp[r3] = 42;});
  Expect.throws(() {exp[Record.empty] = 42;});
  Expect.throws(() {exp[(1,)] = 42;});
  Expect.throws(() {exp[(s: "s")] = 42;});
  Expect.throws(() {exp[(42, s: "s")] = 42;});

  Object r4 = (1, x: 2);
  Expect.throws(() {exp[r4] = 42;});

  dynamic r5 = (x: 2, 1);
  Expect.throws(() {exp[r5] = 42;});
}
