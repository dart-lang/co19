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
/// @description Checks that a named or unnamed constructor can be torn-off
/// using a shorthand syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C<T> {
  T t;
  C(this.t);
  C.id(this.t);
}

extension type ET<T>(T t) {
  ET.id(this.t);
}

main() {
  Object? o = C<int>(0);
  if (o is C<int>) {
    o = .new;
    if (o is Function) {
      Expect.equals(1, o(1).t);
    }
  }
  o = C(0);
  if (o is C) {
    o = .id;
    if (o is Function) {
      Expect.equals(2, o(2).t);
    }
  }

  o = ET<int>(0);
  if (o is ET) {
    o = .new;
    if (o is Function) {
      Expect.equals(3, o(3));
    }
  }
  o = ET<int>(0);
  if (o is ET) {
    o = .id;
    if (o is Function) {
      Expect.equals(4, o(4));
    }
  }
}
