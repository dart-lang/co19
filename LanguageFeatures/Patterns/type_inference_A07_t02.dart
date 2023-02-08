// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// List: A context type schema List<E> where:
///
/// i. If p has a type argument, then E is the type argument.
///
/// ii. Else if p has no elements then E is _.
///
/// iii. Else, infer the type schema from the elements:
///   a. Let es be an empty list of type schemas.
///   b. For each element e in p:
///     a. If e is a matching rest element with subpattern s and the context
///         type schema of s is an Iterable<T> for some type schema T, then add
///         T to es.
///     b. Else if e is not a rest element, add the context type schema of e to
///         es.
///     Else, e is a rest element without an iterable element type, so it
///     doesn't contribute to inference.
///   c. If es is empty, then E is _. This can happen if the list pattern
///     contains only a rest element which doesn't have a context type schema
///     that is known to be an Iterable<T> for some T, like:
///       var [...] = [1, 2];
///       var [...x] = [1, 2];
///   d. Else E is the greatest lower bound of the type schemas in es.
///
/// @description Check that if list pattern p has no elements then E is _
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  String log = "";
  var [] = getType([], (String s) {log += s;});
  Expect.equals("List<dynamic>", log);

  String log = "";
  final [] = getType([], (String s) {log += s;});
  Expect.equals("List<dynamic>", log);
}
