// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Dart semantics, static and dynamic, do not follow the grammar
/// precisely. For example, a static member invocation expression of the form
/// `C.id<T1>(e2)` is treated as an atomic entity for type inference (and
/// runtime semantics). It’s not a combination of doing a `C.id` tear-off, then
/// a `<T1>` instantiation and then an `(e2)` invocation. The context type of
/// that entire expression is used throughout the inference, where
/// `(e1.id<T1>)(e2)` has `(e1.id<T1>)` in a position where it has no context
/// type.
///
/// Because of that, the specification of the static and runtime semantics of
/// the new constructs needs to address all the forms `.id`, `.id<typeArgs>`,
/// `.id(args)`, `.id<typeArgs>(args)`, `.new` or `.new(args)`.
/// ...
/// The general rule is that any of the expression forms above, starting with
/// `.id`, are treated exactly as if they were preceded by a fresh prefixed
/// identifier `_p.C` which denotes the declaration of the type of the context
/// type scheme of the entire `<staticMemberShorthand>`.
///
/// @description Checks that `staticMemberShorthand` invokes the correct static
/// member depending on the context type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class A {
  String log = "";

  A() {
    log = "A.new";
  }
  A.id() {
    log = "A.id";
  }
}

class C extends A {
  C() {
    log = "C.new";
  }
  C.id() {
    log = "C.id";
  }
  factory C.f1() => .new();
  factory C.f2() => .id();
}

class D extends C {
  D() {
    log = "D.new";
  }
  D.id() {
    log = "D.id";
  }
}

A foo1() => .new();
A foo2() => .id();

C bar1() => .new();
C bar2() => .id();

D baz1() => .new();
D baz2() => .id();

main() {
  var c1 = C.f1();
  Expect.equals("C.new", c1.log);

  var c2 = C.f2();
  Expect.equals("C.id", c2.log);

  var a1 = foo1();
  Expect.equals("A.new", a1.log);

  var a2 = foo2();
  Expect.equals("A.id", a2.log);

  var c3 = bar1();
  Expect.equals("C.new", c3.log);

  var c4 = bar2();
  Expect.equals("C.id", c4.log);

  var d1 = baz1();
  Expect.equals("D.new", d1.log);

  var d2 = baz2();
  Expect.equals("D.id", d2.log);
}
