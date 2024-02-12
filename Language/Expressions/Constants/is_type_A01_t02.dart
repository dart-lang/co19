// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// • An expression of the form e is T is potentially constant if e is a
///   potentially constant expression and T is a constant type expression, and
///   it is further constant if e is constant.
/// ...
/// A constant type expression is one of:
/// • An simple or qualified identifier denoting a type declaration (a type
///   alias, class or mixin declaration) that is not qualified by a deferred
///   prefix, optionally followed by type arguments of the form <T1, ..., Tn>
///   where T1, ..., Tn are constant type expressions.
/// • A type of the form FutureOr<T> where T is a constant type expression.
/// • A function type R Function<typeParameters>(argumentTypes) (where
///   R and <typeParameters> may be omitted) and where R, typeParameters
///   and argumentTypes (if present) contain only constant type expressions.
/// • The type void.
/// • The type dynamic
///
/// @description Checks that an expression of the form `e is T` is a constant
/// expression if `e` is a constant expression and `T` is a constant type
/// expression. Test different constant type expressions
/// @author sgrekhov22@gmail.com
/// @issue 54636

// SharedOptions=--enable-experiment=inline-class

import "dart:async";
import "../../../Utils/expect.dart";

mixin M {}

class C<T> with M {
  const C();
}

typedef CNumAlias = C<num>;

enum E {
  e1, e2;
}

extension type const IntET1(int _) {}
extension type const IntET2(int _) implements int {}

typedef IntET1Alias = IntET1;
typedef IntET2Alias = IntET2;

void foo() {}
void as() {}
int bar<T>(T t) => 42;

main() {
  const c1 = C() is C;
  const c2 = C() is M;
  const c3 = E.e1 is E;
  const c4 = C<int>() is C<num>;
  const c5 = C<int>() is CNumAlias;
  const c6 = IntET1(1) is IntET2Alias;
  const c7 = IntET2(1) is IntET1Alias;

  const fo1 = C() is FutureOr<C>;
  const fo2 = C() is FutureOr<M>;
  const fo3 = E.e1 is FutureOr<E>;
  const fo4 = C<int>() is FutureOr<C<num>>;
  const fo5 = C<int>() is FutureOr<CNumAlias>;
  const fo6 = IntET1(1) is FutureOr<IntET2Alias>;
  const fo7 = IntET2(1) is FutureOr<IntET1Alias>;

  const f1 = foo is void Function();
  const f2 = (bar<int>) is int Function(int);

  const d = 2 is dynamic;

  Expect.isTrue(c1);
  Expect.isTrue(c2);
  Expect.isTrue(c3);
  Expect.isTrue(c4);
  Expect.isTrue(c5);
  Expect.isTrue(c6);
  Expect.isTrue(c7);
  Expect.isTrue(fo1);
  Expect.isTrue(fo2);
  Expect.isTrue(fo3);
  Expect.isTrue(fo4);
  Expect.isTrue(fo5);
  Expect.isTrue(fo6);
  Expect.isTrue(fo7);
  Expect.isTrue(f1);
  Expect.isTrue(f2);
  Expect.isTrue(f2);
  Expect.isTrue(d);
}
