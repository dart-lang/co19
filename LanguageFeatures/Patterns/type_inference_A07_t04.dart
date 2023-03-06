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
///   c. If es is empty, then E is _. This can happen if the list pattern
///     contains only a rest element which doesn't have a context type schema
///     that is known to be an Iterable<T> for some T, like:
///       var [...] = [1, 2];
///       var [...x] = [1, 2];
///   d. Else E is the greatest lower bound of the type schemas in es.
///
/// @description Check that the context type schema for list pattern is
/// the greatest lower bound of the context type schemas of the subpatterns.
/// Test the case when there is a matching rest element
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";
import "patterns_lib.dart";

class A {}
class B extends A {}
class C extends B {}
class D extends C {}

main() {
  A a = A();
  B b = B();
  C c = C();
  D d = D();

  String log = "";
  try {
    var [A v1, ...List<B> r, v2] = getType([], (String s) {log += s;});
  } catch (_) {}
  Expect.equals("List<B>", log);

  log = "";
  try {
    var [A v1, ...r, v2] = getType([], (String s) {log += s;});
  } catch (_) {}
  Expect.equals("List<A>", log);

  log = "";
  try {
    final [A v1, C v2, ...List<B> r] = getType([], (String s) {log += s;});
  } catch (_) {}
  Expect.equals("List<C>", log);

  log = "";
  try {
    final [A v1, C v2, ...r] = getType([], (String s) {log += s;});
  } catch (_) {}
  Expect.equals("List<C>", log);

  log = "";
  try {
    var [v1, v2, ...r] = getType([], (String s) {log += s;});
  } catch (_) {}
  Expect.equals("List<Object?>", log);

  log = "";
  try {
    var [v1, ..., v2] = getType([], (String s) {log += s;});
  } catch (_) {}
  Expect.equals("List<Object?>", log);
}
