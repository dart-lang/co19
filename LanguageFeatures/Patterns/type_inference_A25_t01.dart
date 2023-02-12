// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Identifier:
///
/// In an assignment context, the required type of p is the (unpromoted) static
/// type of the variable that p resolves to.
///
/// In a matching context, the name refers to a constant. Type check the
/// constant identifier expression in context type M.
///
/// In a declaration context, the required type of p is M, as is the static type
/// of the variable introduced by p.
///
/// @description Check that in an assignment context, the required type of p is
/// the unpromoted static type of the variable that p resolves to
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/static_type_helper.dart";

main() {
  num a = 0;
  a = 42;
  a.expectStaticType<Exactly<num>>();

  var (num b,) = (0,);
  (b,) = (42,);
  b.expectStaticType<Exactly<num>>();

  var c = 2 > 1 ? 42 : 3.14;
  c = 0;
  c.expectStaticType<Exactly<num>>();
  c = 3.14;
  c.expectStaticType<Exactly<num>>();
}
