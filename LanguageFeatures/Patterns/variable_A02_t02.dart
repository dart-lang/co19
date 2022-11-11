// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// variablePattern ::= ( 'var' | 'final' | 'final'? type )? identifier
///
/// A variable pattern binds the matched value to a new variable. These usually
/// occur as subpatterns of a destructuring pattern in order to capture a
/// destructured value.
/// ```dart
/// var (a, b) = (1, 2);
/// ```
/// Here, a and b are variable patterns and end up bound to 1 and 2,
/// respectively.
///
/// The pattern may have a type annotation in order to only match values of the
/// specified type. If the type annotation is omitted, the variable's type is
/// inferred and the pattern matches all values.
/// ```dart
/// switch (record) {
///   case (int x, String s):
///     print('First field is int $x and second is String $s.');
/// }
/// ```
/// @description Check that if the type annotation is specified then the
/// the pattern matches values of the appropriate type only. Test record
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

class C {
  @override
  String toString() => "C";
}

String test(Record r) {
  switch (r) {
    case (int a, String b):
      a.expectStaticType<Exactly<int>>();
      b.expectStaticType<Exactly<String>>();
      return "(<int>$a, <String>$b)";
    case (int c, final int d):
      c.expectStaticType<Exactly<int>>();
      d.expectStaticType<Exactly<int>>();
      return "(<int>$c, <int>$d)";
    case (String e, bool f):
      e.expectStaticType<Exactly<String>>();
      f.expectStaticType<Exactly<bool>>();
      return "(<String>$e, <bool>$f)";
    case (int g, final h):
      g.expectStaticType<Exactly<int>>();
      return "(<int>$g,  final $h)";
    default:
      return "default";
  }
}

main() {
  Expect.equals("(<int>1, <String>x)", test((1, "x")));
  Expect.equals("(<int>42, <String>answer)", test((42, "answer")));
  Expect.equals("(<int>1, <int>2)", test((1, 2)));
  Expect.equals("(<int>3, <int>4)", test((3, 4)));
  Expect.equals("(<String>x, <bool>true)", test(("x", true)));
  Expect.equals("(<String>y, <bool>false)", test(("y", false)));
  Expect.equals("(<int>0, final false)", test((0, false)));
  Expect.equals("(<int>1, final C)", test((1, C())));
  Expect.equals("default", test((true, false)));
  Expect.equals("default", test((C(), C())));
  Expect.equals("default", test((1, 2, 3)));
  Expect.equals("default", test((1,)));
  Expect.equals("default", test((1, "2", 3)));
  Expect.equals("default", test(("x",)));
}
