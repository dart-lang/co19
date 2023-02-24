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
/// Variable:
/// i. Let T be the static type of the variable p declares or assigns to.
/// ii. If the runtime type of v is not a subtype of T then the match fails.
/// iii. Otherwise, store v in p's variable and the match succeeds.
///
/// @description Checks that if the runtime type of `v` is a subtype of the
/// static type of the variable `p` declares or assigns to, then `v` is stored
/// in `p`s variable and match succeeds
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(Object? o) {
  switch (o) {
    case int v1:
      return "match-1=$v1";
    case final String v2:
      return "match-2=$v2";
    case num? v3:
      return "match-3=$v3";
    default:
      return "no match";
  }
}

String test2(Object? o) {
  if (o case int v1) {
    return "match-1=$v1";
  }
  if (o case final String v2) {
    return "match-2=$v2";
  }
  if (o case num? v3) {
    return "match-3=$v3";
  }
  return "no match";
}

String test3(Object? o) =>
  switch (o) {
    int v1 => "match-1=$v1",
    final String v2 => "match-2=$v2",
    num? v3 => "match-3=$v3",
    _ => "no match"
  };

main() {
  int? answer = 42;
  Expect.equals("match-1=1", test1(1));
  Expect.equals("match-1=1", test1(1 as dynamic));
  Expect.equals("match-2=1", test1("1"));
  Expect.equals("match-2=1", test1("1" as dynamic));
  Expect.equals("match-1=42", test1(answer));
  Expect.equals("match-3=null", test1(null));
  Expect.isTrue(test1(3.14).startsWith("match-3=3.14"));
  Expect.equals("no match", test1(true));

  Expect.equals("match-1=1", test2(1));
  Expect.equals("match-1=1", test2(1 as dynamic));
  Expect.equals("match-2=1", test2("1"));
  Expect.equals("match-2=1", test2("1" as dynamic));
  Expect.equals("match-1=42", test2(answer));
  Expect.equals("match-3=null", test2(null));
  Expect.isTrue(test2(3.14).startsWith("match-3=3.14"));
  Expect.equals("no match", test2(true));

  Expect.equals("match-1=1", test3(1));
  Expect.equals("match-1=1", test3(1 as dynamic));
  Expect.equals("match-2=1", test3("1"));
  Expect.equals("match-2=1", test3("1" as dynamic));
  Expect.equals("match-1=42", test3(answer));
  Expect.equals("match-3=null", test3(null));
  Expect.isTrue(test3(3.14).startsWith("match-3=3.14"));
  Expect.equals("no match", test3(true));
}
