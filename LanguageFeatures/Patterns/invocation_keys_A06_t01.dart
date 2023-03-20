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
/// Identifier:
/// i. In a matching context, the same as a constant pattern whose constant
///   expression is the identifier.
/// ii. Else, nothing to do.
///
/// @description Checks that invocation key `("identifier==", [arg])` is called
/// only once for each pair `identifier==` and `arg`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C {
  final int value;
  final void Function(String) logger;
  const C(this.value, this.logger);

  @override
  bool operator ==(Object other) {
    logger("C($value) == $other;");
    if (other is int) {
      return this.value == other;
    }
    return super == other;
  }
}

String log = "";

void logger(String s) {
  log += s;
}

const c1 = C(1, logger);
const c2 = C(2, logger);
const c3 = C(3, logger);

String test1(int i) {
  switch (i) {
    case c1:
      return "1";
    case c2:
      return "2";
    case c1:
      return "1-2";
    case c3:
      return "3";
    default:
      return "no match";
  }
}

String test2(int i) {
  return switch (i) {
    c1 => "1",
    c2 => "2",
    c1 => "1-2",
    c3 => "3",
    _ => "no match"
  };
}

main() {
  Expect.equals("3", test1(3));
  Expect.equals("C(1) == 3;C(2) == 3;C(3) == 3;", log);
  log = "";
  Expect.equals("3", test2(3));
  Expect.equals("C(1) == 3;C(2) == 3;C(3) == 3;", log);
}
