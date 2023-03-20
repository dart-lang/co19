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
/// @description Checks that for a logical-or pattern invocation keys
/// `parent:(field, [])` are invoked only once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_collections_lib.dart";
import "../../Utils/expect.dart";

String test1(Object o) {
  switch (o) {
    case <int>[0, 1, 2] || <int>[1, 3, 4]: // Expect call length, [0], [1]
      return "match-1";
    case <int>[1, 2, 3]: // Expect call [2]
      return "match-2";
    default:
      return "no match";
  }
}

String test2(Object o) =>
  switch (o) {
    [0, 1, 2] || [1, 3, 4] => "match-1",
    [1, 2, 3] => "match-2",
    _ => "no match"
  };

main() {
  final ml = MyList<int>([1, 2, 3]);
  Expect.equals("match-2", test1(ml));
  Expect.equals("length;[0];[1];[2];", ml.log);
  ml.clearLog();

  Expect.equals("match-2", test2(ml));
  Expect.equals("length;[0];[1];[2];", ml.log);
  ml.clearLog();
}
