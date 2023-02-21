// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Variable:
///
/// If the variable has a type annotation, the required type of p is that type,
/// as is the static type of the variable introduced by p.
///
/// Else the required type of p is M, as is the static type of the variable
/// introduced by p
///
/// @description Check that if a variable pattern has no type annotation, then
/// the required type of `p` is   M .
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

String test1(int x) {
  switch (x) {
    case var v:
      v.expectStaticType<Exactly<int>>();
      return "match";
    default:
      return "no match";
  }
}

String test2(int x) {
  switch (x) {
    case final v:
      v.expectStaticType<Exactly<int>>();
      return "match";
    default:
      return "no match";
  }
}

String test3(int x) {
  if (x case var v) {
    v.expectStaticType<Exactly<int>>();
    return "match";
  }
  return "no match";
}

String test4(int x) {
  if (x case final v) {
    v.expectStaticType<Exactly<int>>();
    return "match";
  }
  return "no match";
}

String test5(int x) =>
  switch (x) {
    var v when v.expectStaticType<Exactly<int>>() is int => "match",
    _ => "no match"
  };

String test6(int x) =>
  switch (x) {
    var v when v.expectStaticType<Exactly<int>>() is int => "match",
    _ => "no match"
  };

main() {
  var (v1) = 42;
  v1.expectStaticType<Exactly<int>>();
  final (v2) = 42 as num?;
  v2.expectStaticType<Exactly<num?>>();

  Expect.equals("match", test1(42));
  Expect.equals("match", test2(42));
  Expect.equals("match", test3(42));
  Expect.equals("match", test4(42));
  Expect.equals("match", test5(42));
  Expect.equals("match", test6(42));
}
