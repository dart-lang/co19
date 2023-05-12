// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A built-in class [Record] with no members except those inherited
/// from [Object]. All record types are a subtype of this class. This type
/// cannot be constructed, extended, mixed in, or implemented by user-defined
/// classes.
///
/// @description Checks that class [Record] may have an extension
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

extension on Record {
  int foo() => 42;
}

extension on (int, {String s}) {
  String bar() => "It's me";
}

main() {
  var r1 = (3, 1, 4, name: "Pi");
  Expect.equals(42, r1.foo());

  var r2 = (42, s: "");
  Expect.equals("It's me", r2.bar());

  dynamic x1 = (1, 2);
  Expect.throws(() {x1.bar();});

  dynamic x2 = (1, wrongName: "");
  Expect.throws(() {x2.bar();});
}
