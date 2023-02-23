// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// List:
///
/// i. Calculate the value's element type E:
///
///   a. If p has a type argument T, then E is the type T.
///   b. Else if M implements List<T> for some T then E is T.
///   c. Else if M is dynamic then E is dynamic.
///   d. Else E is Object?.
///
/// ii. Type-check each non-rest element subpattern using E as the matched value
///   type. Note that we calculate a single element type and use it for all
///   subpatterns. In:
///     var [a, b] = [1, 2.3];
///   both a and b use num as their matched value type.
///
/// iii. If there is a matching rest element, type-check its subpattern using
///   List<E> as the matched value type.
///
/// iv. The required type of p is List<E>.
///
/// @description Check that each non-rest element subpattern is type checked
/// using `E` as the matched value type. Test that it not an error if type test
/// fails in an refutable context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1() {
  switch(["42"]) {
    case <String>[int v]:
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  switch([42]) {
    case <String>[int v]:
      return "match";
    default:
      return "no match";
  }
}

String test3() {
  if(["42"] case <String>[int v]) {
    return "match";
  }
  return "no match";
}

String test4() {
  if([42] case <String>[int v]) {
    return "match";
  }
  return "no match";
}

String test5() =>
  switch(["42"]) {
    <String>[int v] => "match",
    _ => "no match"
  };

String test6() =>
  switch(["42"]) {
    <String>[int v] => "match",
    _ => "no match"
  };

main() {
  Expect.equals("no match", test1());
  Expect.equals("no match", test2());
  Expect.equals("no match", test3());
  Expect.equals("no match", test4());
  Expect.equals("no match", test5());
  Expect.equals("no match", test6());
}
