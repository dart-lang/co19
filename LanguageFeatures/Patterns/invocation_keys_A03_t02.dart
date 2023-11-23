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
/// Relational:
/// i. If the matched value type is dynamic, is Never, or declares the operator,
///   then bind i : (op, [arg]) to the operator method invocation where op is
///   the name of the operator and arg is the right operand value.
/// ii. Else perform extension method resolution and infer the extension's type
///   arguments. Bind i : extension(op, [arg]) to the operator method invocation
///   where extension is the resolved extension and its type arguments, op is
///   the name of the operator and arg is the right operand value.
///
/// @description Checks that if `v` declares an operator `op`, then `op(arg)`
/// is called only once on `v` for each `arg`. Test the case when `v` is dynamic
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C {
  final int value;
  String log = "";
  C(this.value);

  void clearLog() {
    log = "";
  }

  bool operator >(Object other) {
    log += "C($value) > $other;";
    if (other is int) {
      return this.value > other;
    }
    return false;
  }
}

String test1(dynamic c) {
  switch (c) {
    case > 3:
      return "3";
    case > 2:
      return "2";
    case > 3:
      return "3-2";
    case > 1:
      return "1";
    default:
      return "no match";
  }
}

String test2(dynamic c) {
  return switch (c) {
    > 3 => "3",
    > 2 => "2",
    > 3 => "3-2",
    > 1 => "1",
    _ => "no match"
  };
}

main() {
  C c2 = C(2);
  Expect.equals("1", test1(c2));
  Expect.equals("C(2) > 3;C(2) > 2;C(2) > 1;", c2.log);
  c2.clearLog();
  Expect.equals("1", test2(c2));
  Expect.equals("C(2) > 3;C(2) > 2;C(2) > 1;", c2.log);
}
