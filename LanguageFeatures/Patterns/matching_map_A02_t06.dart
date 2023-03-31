// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At runtime, a pattern is matched against a value. This determines
/// whether or not the match fails and the pattern refutes the value. If the
/// match succeeds, the pattern may also destructure data from the object or
/// bind variables.
///
/// Refutable patterns usually occur in a context where match refutation causes
/// execution to skip over the body of code where any variables bound by the
/// pattern are in scope. If a pattern match failure occurs in an irrefutable
/// context, a runtime error is thrown.
///
/// To match a pattern p against a value v:
/// ...
/// Map:
/// i. If the runtime type of v is not a subtype of the required type of p then
///   the match fails.
/// ii. For each entry in p, in source order:
///   a. Evaluate the key expression to k.
///   b. Evaluate v[k] to r.
///   c. If r != null || (null is V) && v.containsKey(k) evaluates to false then
///     the map does not match.
///     Note:
///       -  When v[k] returns a non-null value, we know the key is present and
///         we short-circuit the containsKey() call.
///       - If V is known to be a non-nullable type, then null is V is always
///         false and the expression simplifies to:
///           r != null
///       - Conversely, if V is known to be a nullable type, then null is V is
///         always true and the expression simplifies to:
///           r != null || v.containsKey(k)
///       - When V is a potentially nullable type, the null is V test must be
///         performed but can be hoisted out and shared across all entries since
///         it doesn't depend on k.
///       - If v is a poorly behaved Map whose v[k] and containsKey(k) results
///         don't agree (i.e. a non-null v[k] and false containsKey(k) or vice
///         versa) we do not detect that mismatch. Since badly behaved maps are
///         rare, this is allowed. Even if v is poorly behaved, a null value
///         will only be passed to the subpattern if null is V, so soundness is
///         preserved.
///   d. Else, match r against this entry's value subpattern. If it does not
///     match, the map does not match.
/// iii. The match succeeds if all entry subpatterns match.
///
/// @description Checks that for each entry in `p`, in source order, if
/// `v[k] != null || (null is V) && v.containsKey(k)` evaluates to `false` then
/// the map does not match. Test that if `V` is non-nullable and `v[k] == null`
/// then `v.containsKey(k)` is not called
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns
// Requirements=nnbd-strong

import "patterns_collections_lib.dart";
import "../../Utils/expect.dart";

String test1(Object o) {
  switch (o) {
    case <String, int>{"key1": _, "key2": _}:
      return "match";
    default:
      return "no match";
  }
}

String test2(Object o) {
  if (o case <String, int>{"key1": _, "key2": _}) {
    return "match";
  }
  return "no match";
}

String test3(Object o) {
  return switch (o) {
    <String, int>{"key1": _, "key2": _} => "match",
    _ => "no match"
  };
}

main() {
  final map = MyMap<String, int>({"keyX": 0, "key2": 2});
  Expect.equals("no match", test1(map));
  Expect.equals("[key1];", map.log);
  map.clearLog();
  Expect.equals("no match", test2(map));
  Expect.equals("[key1];", map.log);
  map.clearLog();
  Expect.equals("no match", test3(map));
  Expect.equals("[key1];", map.log);
  map.clearLog();

  Expect.throws(() {
    var <String, int>{"key1": _, "key2": _} = map;
  });
  Expect.equals("[key1];", map.log);
  map.clearLog();
  Expect.throws(() {
    final <String, int>{"key1": _, "key2": _} = map;
  });
  Expect.equals("[key1];", map.log);
}
