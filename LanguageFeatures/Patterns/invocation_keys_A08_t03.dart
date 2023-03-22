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
/// Map:
/// i. Bind i : ("length", []) to the length getter invocation.
/// ii. For each entry in p:
///   a. Bind i : ("containsKey()", [key]) to the containsKey() invocation where
///     key is entry's key constant value.
///   b. Let e be i : ("[]", [key]) where key is entry's key constant value.
///   c. Bind e to the [] invocation for this entry.
///   d. Bind invocations in the entry value subpattern using parent e.
///
/// @description Checks that for a map pattern invocation keys `("length", [])`,
/// `("containsKey()", [key])` and `("[]", [key])` are invoked only once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "patterns_collections_lib.dart";

String test1(Object o) {
  switch (o) {
    case <String, int>{"key1": 1}: // Expect call length
      return "match-1";
    case <String, int>{"key1": _, "key2": 3}: // Expect call [key1], [key2]
      return "match-2";
    case <String, int>{"key1": _, "key2": _, ...}: // Expect no additional calls
      return "match-3";
    default:
      return "no match";
  }
}

String test2(Object o) =>
  switch (o) {
    <String, int>{"key1": 1} => "match-1",
    <String, int>{"key1": _, "key2": 3} => "match-2",
    <String, int>{"key1": _, "key2": _, ...} => "match-3",
    _ => "no match"
  };

main() {
  final map = MyMap<String, int>({"key1": 1, "key2": 2});
  Expect.equals("match-3", test1(map));
  Expect.equals("length;[key1];[key2];", map.log);
  map.clearLog();

  Expect.equals("match-3", test2(map));
  Expect.equals("length;[key1];[key2];", map.log);
  map.clearLog();

  var {"key1": _, "key2": _, ...} = map;
  Expect.equals("length;[key1];[key2];", map.log);
  map.clearLog();

  final {"key1": _, "key2": _, ...} = map;
  Expect.equals("length;[key1];[key2];", map.log);
}
