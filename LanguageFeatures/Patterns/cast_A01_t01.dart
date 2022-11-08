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
/// @description Check some valid cast patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";

main() {
  (num, Object) r1 = (1, "s");
  var (i as int, s as String) = r1;
  i.expectStaticType<Exactly<int>>();
  s.expectStaticType<Exactly<String>>();

  (Record,) r2 = ((),);
  var (rec1 as (),) = r2;
  rec1.expectStaticType<Exactly<()>>();

  ({num n, Object o}) r3 = (n: 1, o: "s");
  var (n: n as int, o: o as String) = r3;
  n.expectStaticType<Exactly<int>>();
  o.expectStaticType<Exactly<String>>();

  ({Record r}) r4 = (r: ());
  var (r: rec2 as ()) = r4;
  rec2.expectStaticType<Exactly<()>>();
}
