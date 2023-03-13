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
/// ii. Let n be the number of non-rest elements.
/// iii. Check the length:
///   a. If p has a rest element and n == 0, then do nothing for checking the
///     length.
///   b. Else let l be the length of the map determined by calling length on v.
///   c. If p has a rest element (and n > 0):
///     a. If l < n then the match fails.
///   d. Else if n > 0 (and p has no rest element):
///     a. If l != n then the match fails.
///   e. Else p is empty:
///     a. If l > 0 then the match fails.
/// iv. For each non-rest entry in p, in source order:
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
/// v. The match succeeds if all entry subpatterns match.
///
/// @description Checks that if the runtime type of `v` is not a subtype of the
/// required type of `p` then the match fails and no any member of `v` is called
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "dart:collection";
import "../../Utils/expect.dart";

String log = "";

class MyMap<K, V> extends MapBase<K, V> {
  Map<K, V> _inner;

  MyMap(this._inner);

  @override
  operator [](Object? key) {
    log += "[$key];";
    return _inner[key];
  }

  @override
  void operator []=(key, value) {
    log += "[$key]=$value;";
    _inner[key] = value;
  }

  @override
  void clear() {
    log += "clear();";
    _inner.clear();
  }

  @override
  Iterable<K> get keys {
    log += "keys;";
    return _inner.keys;
  }

  @override
  remove(Object? key) {
    log += "remove($key);";
    return _inner.remove(key);
  }
}

String test1(Object o) {
  switch (o) {
    case <String, int>{"key1": 42}:
      return "match-1";
    case <String, num>{"key1": 42}:
      return "match-2";
    default:
      return "no match";
  }
}

String test2(Object o) {
  if (o case <String, int>{"key1": 42}) {
    return "match-1";
  }
  if (o case <String, num>{"key1": 42}) {
    return "match-2";
  }
  return "no match";
}

String test3(Object o) {
  return switch (o) {
    <String, int>{"key1": 42} => "match-1",
    <String, num>{"key1": 42} => "match-2",
    _ => "no match"
  };
}

void test4(dynamic o) {
  var <String, int>{"key1": v} = o;
}

main() {
  Expect.equals("no match", test1(MyMap<String, dynamic>({"key1": 42.0})));
  Expect.equals("", log);
  Expect.equals("no match", test1(MyMap<String, dynamic>({"key1": 42})));
  Expect.equals("", log);
  Expect.equals("no match", test1(MyMap<String, String>({"key1": "42"})));
  Expect.equals("", log);
  Expect.equals("no match", test1(MyMap<String, int?>({"key1": 42})));
  Expect.equals("", log);
  Expect.equals("no match", test1(MyMap<String, num?>({"key1": 42})));
  Expect.equals("", log);

  Expect.equals("no match", test2(MyMap<String, dynamic>({"key1": 42.0})));
  Expect.equals("", log);
  Expect.equals("no match", test2(MyMap<String, dynamic>({"key1": 42})));
  Expect.equals("", log);
  Expect.equals("no match", test2(MyMap<String, String>({"key1": "42"})));
  Expect.equals("", log);
  Expect.equals("no match", test2(MyMap<String, int?>({"key1": 42})));
  Expect.equals("", log);
  Expect.equals("no match", test2(MyMap<String, num?>({"key1": 42})));
  Expect.equals("", log);

  Expect.equals("no match", test3(MyMap<String, dynamic>({"key1": 42.0})));
  Expect.equals("", log);
  Expect.equals("no match", test3(MyMap<String, dynamic>({"key1": 42})));
  Expect.equals("", log);
  Expect.equals("no match", test3(MyMap<String, String>({"key1": "42"})));
  Expect.equals("", log);
  Expect.equals("no match", test3(MyMap<String, int?>({"key1": 42})));
  Expect.equals("", log);
  Expect.equals("no match", test3(MyMap<String, num?>({"key1": 42})));
  Expect.equals("", log);

  Expect.throws(() {
    test4(MyMap<String, num>({"key1": 42}));
  });
  Expect.equals("", log);
  Expect.throws(() {
    test4(MyMap<String, dynamic>({"key1": 42}));
  });
  Expect.equals("", log);
  Expect.throws(() {
    test4(MyMap<String, int?>({"key1": 42}));
  });
  Expect.equals("", log);
  Expect.throws(() {
    test4(MyMap({"key1": "42"}));
  });
  Expect.equals("", log);
}
