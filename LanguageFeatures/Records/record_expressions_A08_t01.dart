// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record is created using a record expression. The grammar is:
///
/// literal      ::= record
///                | // Existing literal productions...
/// record       ::= 'const'? (' recordField ( ',' recordField )* ','? ')'
/// recordField  ::= (identifier ':' )? expression
///
/// This is identical to the grammar for a function call argument list. There
/// are a couple of syntactic restrictions not captured by the grammar. It is a
/// compile-time error if a record has any of:
///
/// The same field name more than once.
///
/// Only one positional field and no trailing comma.
///
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// A field name that collides with the synthesized getter name of a positional
/// field. For example: ('pos', $0: 'named') since the named field '$0' collides
/// with the getter for the first positional field.
///
/// @description Checks that variables can be used in record expressions
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

int i = 42;
double pi = 3.14;
String s = "Lily was here";

var r1 = (i, name: pi, s);

(int, double, String) foo() {
  int x = 0;
  return (x++, 1.1 + x, s);
}

class A {
  (num, {String name}) ar;
  A(this.ar);
}

class C extends A {
  static int ci = 42;
  static final sr = (ci, C.ci, i);

  int cx = 1;
  (int, {String s}) cr;

  C(this.cr): super((i, name: "answer"));
  C.c1(): cr = (-1, s: s), super((pi, name: "pi"));

  (Record, int, {int s}) m() {
    int _x0 = 1;
    return (s: cx, sr, ++_x0);
  }

  (int, {Record x}) get g => (cx, x: cr);
}

main() {
  var r = (Expect.equals,);
  C c = C((i, s: s));
  C c1 = C.c1();

  Expect.equals(i, r1.$0);
  Expect.equals(pi, r1.name);
  Expect.equals(s, r1.$1);
  Expect.equals(0, foo().$0);
  Expect.equals(2.1, foo().$1);
  Expect.equals(s, foo().$2);
  Expect.equals(-1, c1.cr.$0);
  Expect.equals(s, c1.cr.s);
  Expect.equals(i, c.cr.$0);
  Expect.equals(s, c.cr.s);
  Expect.equals("answer", c.ar.name);
  Expect.equals(i, c.ar.$0);
  Expect.equals(C.ci, C.sr.$0);
  Expect.equals(C.ci, C.sr.$1);
  Expect.equals(i, C.sr.$2);
  Expect.equals(c1.cx, c1.m().s);
  Expect.equals(C.sr, c1.m().$0);
  Expect.equals(2, c1.m().$1);
  Expect.equals(c1.cx, c1.g.$0);
  Expect.equals(c1.cr, c1.g.x);
  Expect.equals("pi", c1.ar.name);
  Expect.equals(pi, c1.ar.$0);
  Expect.equals(Expect.equals, r.$0);
}
