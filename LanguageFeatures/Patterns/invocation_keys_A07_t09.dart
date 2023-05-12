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
/// List:
/// i. Bind i : ("length", []) to the length getter invocation.
/// ii. For each element subpattern s:
///   a. If s is a rest element:
///     a. Let e be i : ("sublist()", [h, t]) where h is the number of elements
///       preceding s and t is the number of elements following it.
///     b. Bind e to the sublist() invocation for s.
///   b. Else if s precedes a rest element (or there is no rest element):
///     a. Let e be i : ("[]", [index]) where index is the zero-based index of
///       this element subpattern.
///     b. Bind e to the [] invocation for s.
///   c. Else s is a non-rest element after the rest element:
///     a. Let e be i : ("tail[]", [index]) where index is the zero-based index
///       of this element subpattern.
///     b. Bind e to the [] invocation for s.
/// d. Bind invocations in the element subpattern using parent e.
///
/// @description Checks that for a list pattern invocation keys `("length", [])`
/// `("[]", [index])` and ("tail[]", [index]) are invoked only once. Test list
/// pattern with a matching rest element in the beginning of the list.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_collections_lib.dart";

String test1(Object o) {
  switch (o) {
    case <int>[1]: // Expect call length
      return "match-1";
    case <int>[... var r, 2, 4]: // Expect call sublist(0, 1), [1], [2]
      return "match-2";
    case <int>[1, _, 3]: // Expect call [0], [2]
      return "match-3";
    default:
      return "no match";
  }
}

String test2(Object o) =>
  switch (o) {
    <int>[1] => "match-1",
    <int>[... var r, 2, 4] => "match-2",
    <int>[1, _, 3] => "match-3",
    _ => "no match"
  };

main() {
  final ml = MyList<int>([1, 2, 3]);
  Expect.equals("match-3", test1(ml));
  Expect.equals("length;sublist(0, 1);[1];[2];[0];[2];", ml.log);
  ml.clearLog();

  Expect.equals("match-3", test2(ml));
  Expect.equals("length;sublist(0, 1);[1];[2];[0];[2];", ml.log);
  ml.clearLog();

  var <int>[..., x1, x2] = ml;
  Expect.equals("length;[1];[2];", ml.log);
  ml.clearLog();

  final <int>[..., y1, y2] = ml;
  Expect.equals("length;[1];[2];", ml.log);

}
