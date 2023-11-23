// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The pattern variable set for a pattern is:
/// ...
/// Variable:
///
/// If the variable's identifier is _ then the empty set.
///
/// Else a set containing a single variable whose name is the pattern's
/// identifier and whose type is the pattern's required type (which may have
/// been inferred). In a declaration context, the variable is final if the
/// surrounding patternVariableDeclaration has a final modifier. In a matching
/// context, the variable is final if the variable pattern is marked final and
/// is not otherwise.
///
/// @description Check that variable pattern declares a single variable with the
/// pattern's required type
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";
import "patterns_lib.dart";

String test1(int x) {
  switch (x) {
    case var v1 when v1 == 1:
      v1.expectStaticType<Exactly<int>>();
      return "1";
    case final v2 when v2 == 2:
      v2.expectStaticType<Exactly<int>>();
      return "2";
    case final int v3 when v3 == 3:
      v3.expectStaticType<Exactly<int>>();
      return "3";
    case int v4 when v4 == 4:
      v4.expectStaticType<Exactly<int>>();
      return "4";
    default:
      return "default";
  }
}

String test2(int x) =>
  switch (x) {
    var v1 when v1.isOdd && v1 == 1 => "1",
    final v2 when v2.isEven && v2 == 2 => "2",
    final int v3 when v3.isOdd && v3 == 3 => "3",
    int v4 when v4.isEven && v4 == 4 => "4",
    _ => "default"
  };

String test3(int x) {
  if (x case var v1 when v1 == 1) {
    v1.expectStaticType<Exactly<int>>();
    return "1";
  }
  if (x case final v2 when v2 == 2) {
    v2.expectStaticType<Exactly<int>>();
    return "2";
  }
  if (x case final int v3 when v3 == 3) {
    v3.expectStaticType<Exactly<int>>();
    return "3";
  }
  if (x case final int v4 when v4 == 4) {
    v4.expectStaticType<Exactly<int>>();
    return "4";
  }
  return "no match";
}

main () {
  var v1 = 42;
  v1.expectStaticType<Exactly<int>>();

  final v2 = "42";
  v2.expectStaticType<Exactly<String>>();

  final num? v3 = 42;
  v3.expectStaticType<Exactly<num?>>();

  Expect.equals("1", test1(1));
  Expect.equals("2", test1(2));
  Expect.equals("3", test1(3));
  Expect.equals("4", test1(4));
  Expect.equals("1", test2(1));
  Expect.equals("2", test2(2));
  Expect.equals("3", test2(3));
  Expect.equals("4", test2(4));
  Expect.equals("1", test3(1));
  Expect.equals("2", test3(2));
  Expect.equals("3", test3(3));
  Expect.equals("4", test3(4));
}
