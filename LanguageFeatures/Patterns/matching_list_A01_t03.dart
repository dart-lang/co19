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
/// List:
/// i. If the runtime type of v is not a subtype of the required type of p then
///   the match fails.
/// ii. Let h be the number of non-rest elements preceding the rest element if
///   there is one, or the number of elements if there is no rest element.
/// iii. Let t be the number of non-rest elements following the rest element if
///   there is one, or 0 otherwise.
/// iv. Check the length:
///   a. If p has a rest element and h + t == 0, then do nothing for checking
///     the length.
///   b. Else let l be the length of the list determined by calling length on v.
///   c. If p has a rest element (and h + t > 0):
///     a.  If l < h + t then the match fails.
///   d. Else if h + t > 0 (and p has no rest element):
///     a. If l != h + t then the match fails.
///   e. Else p is empty:
///     a. If l > 0 then the match fails.
/// v. Match the head elements. For i from 0 to h - 1, inclusive:
///   a. Let s be the ith element subpattern.
///   b. If s is an identifier pattern whose name is _ then do nothing for this
///     element.
///   c. Else extract the element value e by calling v[i].
///   d. Match s against e.
/// vi. If there is a matching rest element:
///   a. If t > 0 then let r be the result of v.sublist(h, l - t).
///   b. Else let r be the result of v.sublist(h).
///   c. Match the rest element subpattern against r.
/// vii. Match the tail elements. If t > 0, then for i from 0 to t - 1,
///   inclusive:
///   a. Let s be the subpattern i elements after the rest element.
///   b. If s is an identifier pattern whose name is _ then do nothing for this
///     element.
///   c. Else extract the element value e by calling v[l - t + i].
///   d. Match s against e.
/// viii. The match succeeds if all subpatterns match.
///
/// @description Checks that if the runtime type of `v` is not a subtype of the
/// required type of `p` then the match fails and operator `[]` is never invoked
/// @author sgrekhov22@gmail.com

import "patterns_collections_lib.dart";
import "../../Utils/expect.dart";

String test1(Object o) {
  switch (o) {
    case <int>[]:
      return "match-1";
    case <num>[]:
      return "match-2";
    default:
      return "no match";
  }
}

String test2(Object o) {
  if (o case <int>[]) {
    return "match-1";
  }
  if (o case <num>[]) {
    return "match-2";
  }
  return "no match";
}

String test3(Object o) {
  return switch (o) {
    <int>[] => "match-1",
    <num>[] => "match-2",
    _ => "no match"
  };
}

void test4(dynamic o) {
  var <int>[] = o;
}

main() {
  var ml1 = MyList<int?>([42]);
  var ml2 = MyList<num?>([42]);

  Expect.equals("no match", test1(<int?>[]));
  Expect.equals("no match", test1(<num?>[]));
  Expect.equals("no match", test2(<int?>[]));
  Expect.equals("no match", test2(<num?>[]));
  Expect.equals("no match", test3(<int?>[]));
  Expect.equals("no match", test3(<num?>[]));
  Expect.throws(() {
    test4(<int?>[]);
  });

  Expect.equals("", ml1.log);
  Expect.equals("no match", test1(ml2));
  Expect.equals("", ml2.log);
  Expect.equals("no match", test2(ml1));
  Expect.equals("", ml1.log);
  Expect.equals("no match", test2(ml2));
  Expect.equals("", ml2.log);
  Expect.equals("no match", test3(ml1));
  Expect.equals("", ml1.log);
  Expect.equals("no match", test3(ml2));
  Expect.equals("", ml2.log);
  Expect.throws(() {
    test4(ml1);
  });
  Expect.equals("", ml1.log);
  Expect.throws(() {
    test4(ml2);
  });
  Expect.equals("", ml2.log);
}
