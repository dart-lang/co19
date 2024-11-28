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
/// `.id`, are treated exactly as if they were prefixed by a fresh identifier
/// `X` which denotes an accessible type alias for the greatest closure of the
/// context type scheme of the following primary and selector chain.
///
/// @description Checks that the processing of the context type for shorthand
/// of the form `.id<typeArgs>` includes a type alias expansion.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  static X id<X>(X x) => x;
}
typedef CAlias = C;

mixin M {
  static X id<X>(X x) => x;
}
typedef MAlias = M;
class MA = Object with M;

enum E {
  e0;
  static X id<X>(X x) => x;
}
typedef EAlias = E;

extension type ET(int _) implements Object {
  static X id<X>(X x) => x;
}
typedef ETAlias = ET;

main() {
  Object o = C();
  if (o is C) {
    o = .id<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = C();
  if (o is CAlias) {
    o = .id<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }

  o = MA();
  if (o is M) {
    o = .id<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = MA();
  if (o is MAlias) {
    o = .id<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }

  o = E.e0;
  if (o is E) {
    o = .id<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = E.e0;
  if (o is EAlias) {
    o = .id<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }

  o = ET(0);
  if (o is ET) {
    o = .id<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = ET(1);
  if (o is EAlias) {
    o = .id<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
}
