// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a record type has any of:
///
/// The same field name more than once. This is true even if one or both of the
/// colliding fields is positional. We could permit collisions with positional
/// field names since they are only used for documentation, but we disallow it
/// because it's confusing and not useful.
///
/// Only one positional field and no trailing comma. This isn't ambiguous, since
/// there are no parenthesized type expressions in Dart. But prohibiting this is
/// symmetric with record expressions and leaves the potential for later support
/// for parentheses for grouping in type expressions.
///
/// A named field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// A field name that collides with the synthesized getter name of a positional
/// field. For example: (int, $0: int) since the named field '$0' collides with
/// the getter for the first positional field.
///
/// @description Checks that it is no error if a record type has trailing commas
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

typedef R1 = (int i, String s,);

typedef (int, String s,) R2();

typedef void R3((String s, int,) r);

typedef R4 = (int i, {String s,});

typedef (int, {String s,}) R5();

typedef void R6(({String s, int i,}));

(int, bool,) foo1() => (42, true);

(int, {bool b,}) foo2() => (42, b: true);

({int i, bool b,}) foo3() => (i: 42, b: true);

Record bar1((int i, int j,) r) => r;

Record bar2((int i, {int j,}) r) => r;

Record bar3(({int i, int j,}) r) => r;

main() {
  (int, String,) r1 = (42, "");

  (double d, String s,) r2 = (3.14, "");

  ((int,), Record r,) r3 = ((42,), ());

  (int, {String s,}) r4 = (42, s: "");

  ({double d, String s,}) r5 = (d: 3.14, s: "");

  dynamic d = (1, 2,);
  if (d is (int i, int j,)) {
  }
  if (d is (int i, {int j,})) {
  }
  if (d is ({int i, int j,})) {
  }

  d as (int, int j,);
  d as (int, {int j,});
  d as ({int i, int j,});
}
