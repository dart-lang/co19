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
/// of the forms `.id`, `.id(args)` and `.id<typeArgs>(args)` includes a type
/// alias expansion.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C<T> {
  T t;
  C(this.t);

  static C<int> get id1 => C(1);
  static C<X> id2<X>(X x) => C<X>(x);
}

typedef CAlias<T> = C<T>;
typedef CInt = C<int>;

mixin M<T> on C<T> {
  static M<int> get id1 => MC(1);
  static M<X> id2<X>(X x) => MC<X>(x);
}

class MC<T> = C<T> with M<T>;

typedef MAlias<T> = M<T>;
typedef MInt = M<int>;

enum E<T> {
  e1(1), e2("2");
  final T t;
  const E(this.t);

  static E<int> get id1 => E.e1;
  static E<String> id2() => E.e2;
}

typedef EAlias<T> = E<T>;
typedef EInt = E<int>;

extension type ET<T>(T t) {
  static ET<int> get id1 => ET(1);
  static ET<X> id2<X>(X x) => ET<X>(x);
}

typedef ETAlias<T> = ET<T>;
typedef ETInt = ET<int>;

main() {
  CAlias<int> c1 = .id1;
  Expect.equals(1, c1.t);

  CInt c2 = .id2<int>(2);
  Expect.equals(2, c2.t);

  MAlias<int> m1 = .id1;
  Expect.equals(1, m1.t);

  MInt m2 = .id2<int>(2);
  Expect.equals(2, m2.t);

  EInt e1 = .id1;
  Expect.equals(1, e1.t);

  EAlias<String> e2 = .id2();
  Expect.equals("2", e2.t);

  ETAlias<int> et1 = .id1;
  Expect.equals(1, et1.t);

  ETInt et2 = .id2<int>(2);
  Expect.equals(2, et2.t);
}
