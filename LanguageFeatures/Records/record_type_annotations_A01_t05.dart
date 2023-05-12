// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In the type system, each record has a corresponding record type.
/// A record type looks similar to a function type's parameter list. The type is
/// surrounded by parentheses and may contain comma-separated positional fields:
///
/// (int, String name, bool) triple;
/// Each field is a type annotation and an optional name which isn't meaningful
/// but is useful for documentation purposes.
///
/// Named fields go inside a brace-delimited section of type and name pairs:
///
/// ({int n, String s}) pair;
/// A record type may have both positional and named fields:
///
/// (bool, num, {int n, String s}) quad;
///
/// @description Checks records type annotations used in an extension
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

extension on (int, num, int n, {String name}) {
  int foo() => 42;
}

extension on (int i1, int i2, int i3, {String name}) {
  String bar() => "Hi";
}

main() {
  var r = (3, 1, 4, name: "Pi");
  Expect.equals(42, r.foo());
  Expect.equals("Hi", r.bar());
}
