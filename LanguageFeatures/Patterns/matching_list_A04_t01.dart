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
/// @description Checks that if there is a matching rest element `r` and `t > 0`
/// then `r` is the result of `v.sublist(h, l - t)`
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_collections_lib.dart";

String test1(Object o) {
  switch (o) {
    case [1, 2, ... var r, 5]:
      Expect.listEquals([3, 4], r);
      return "match";
    default:
      return "no match";
  }
}

String test2(Object o) {
  if (o case [1, ... final r, 3]) {
    Expect.listEquals([2], r);
    return "match";
  }
  return "no match";
}

String test3(Object o) =>
  switch (o) {
    [... var r, 3, 4] when r.length == 2 && r[0] == 1 && r[1] == 2 => "match",
    _ => "no match"
  };

main() {
  MyList ml1 = MyList([1, 2, 3, 4, 5]);
  Expect.equals("match", test1(ml1));
  Expect.equals("length;[0];[1];sublist(2, 4);[4];", ml1.log);

  MyList ml2 = MyList([1, 2, 3]);
  Expect.equals("match", test2(ml2));
  Expect.equals("length;[0];sublist(1, 2);[2];", ml2.log);

  MyList ml3 = MyList([1, 2, 3, 4]);
  Expect.equals("match", test3(ml3));
  Expect.equals("length;sublist(0, 2);[2];[3];", ml3.log);
  ml3.clearLog();

  var [x1, x2, ...r1, x4] = ml3;
  Expect.equals("length;[0];[1];sublist(2, 3);[3];", ml3.log);
  Expect.listEquals(r1, [3]);
  ml3.clearLog();

  final [... r2, y3, y4] = ml3;
  Expect.equals("length;sublist(0, 2);[2];[3];", ml3.log);
  Expect.listEquals(r2, [1, 2]);
}
