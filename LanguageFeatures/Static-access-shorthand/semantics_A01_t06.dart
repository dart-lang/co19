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
/// of the form `.id<typeArgs>` includes a type alias expansion. Test prefixed
/// import.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';
import 'shorthand_lib.dart' as p;

main() {
  Object o = p.C();
  if (o is p.C) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = p.C();
  if (o is p.CAlias) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }

  o = p.MA();
  if (o is p.M) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = p.MA();
  if (o is p.MAlias) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }

  o = p.E.e0;
  if (o is p.E) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = p.E.e0;
  if (o is p.EAlias) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }

  o = p.ET(0);
  if (o is p.ET) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = p.ET(1);
  if (o is p.EAlias) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
}
