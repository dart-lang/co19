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
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// A field name that collides with the synthesized getter name of a positional
/// field. For example: (int, $0: int) since the named field '$0' collides with
/// the getter for the first positional field.
///
/// @description Checks that optional name of a positional field may start with
/// an underscore
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

typedef R1 = (int _i, {String s});

typedef (int _, {int n}) R2();

typedef void R3((String _s, {String s}));

(int _, {int n}) foo() => (42, n: 0);

void bar((int _i, {bool b})) {}

main() {
  (int _, {String s}) r1 = (42, s: "");

  (double _d, {int i}) r2 = (3.14, i: 0);

  dynamic d = (1, 3.14);
  if (d is (int _i, {String s})) {
  }

  d as (int _i, {int n});

  print(R1);
  print(R2);
  print(R3);
  print(foo);
  print(bar);
}
