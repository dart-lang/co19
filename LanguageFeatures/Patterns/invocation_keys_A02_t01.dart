// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At runtime, whenever the runtime semantics say to call a member
/// or access a record field, if a previous call or access with that same
/// invocation key has already been evaluated, we reuse the result.
/// ...
/// Given a set of patterns s matching a value expression v, we bind an
/// invocation key to each member invocation and record field access in s like
/// so:
/// 1. Let i be an invocation key with no parent, no extension type, named this,
///   with an empty argument list. This is the root node of the invocation key
///   tree and represents the matched value itself.
/// 2. For each pattern p in s with parent invocation i, bind invocation keys to
///   it and its subpatterns using the following procedure:
/// To bind invocation keys in a pattern p using parent invocation i:
/// ...
/// Logical-or or logical-and:
///
/// i. Bind invocations in the left and right subpatterns using parent i.
///
/// @description Checks that for a logical-and pattern invocation keys
/// `parent:(field, [])` are invoked only once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C {
  final int value;
  String log = "";
  C(this.value);

  void clearLog() {
    log = "";
  }

  int get val {
    log += "C($value).val;";
    return value;
  }
}

String test1(Object o) {
  switch (o) {
    case C(val: 2) && C(val: 3): // Expect call .val
      return "match-1";
    case C(val: 2 ): // Expect no new calls
      return "match-2";
    default:
      return "no match";
  }
}

String test2(Object o) =>
  switch (o) {
    C(val: 2) && C(val: 3) => "match-1",
    C(val: 2) => "match-2",
    _ => "no match"
  };

main() {
  final c = C(2);
  Expect.equals("match-2", test1(c));
  Expect.equals("C(2).val;", c.log);
  c.clearLog();

  Expect.equals("match-2", test2(c));
  Expect.equals("C(2).val;", c.log);
  c.clearLog();

  var (C(val: int x) && C(val: int y)) = c;
  Expect.equals("C(2).val;", c.log);
  c.clearLog();

  final (C(val: int x) && C(val: int y)) = c;
  Expect.equals("C(2).val;", c.log);
}
