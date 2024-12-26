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
/// @description Checks that the processing of the context type for shorthand
/// of the form `.id<typeArgs>` includes a type alias expansion. Test unprefixed
/// import.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';
import 'shorthand_lib.dart';

main() {
  Object o = C(0);
  if (o is C) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = C(0);
  if (o is CAlias) {    // ignore: unnecessary_type_check
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }

  o = MC(0);
  if (o is M) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = MC(0);
  if (o is MAlias) {    // ignore: unnecessary_type_check
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }

  o = E.e1;
  if (o is E) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = E.e1;
  if (o is EAlias) {    // ignore: unnecessary_type_check
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }

  o = ET<int>(0);
  if (o is ET) {
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
  o = ET(1);
  if (o is EAlias) {    // ignore: unnecessary_type_check
    o = .id3<int>;
    if (o is Function) {
      Expect.equals(42, o(42));
    }
  }
}
