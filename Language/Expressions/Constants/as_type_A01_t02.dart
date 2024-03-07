// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// • An expression of the form e as T is potentially constant if e is a
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
/// @description Checks that an expression of the form `e as T` is a constant
/// expression if `e` is a constant expression and `T` is a constant type
/// expression. Test different constant type expressions
/// @author sgrekhov22@gmail.com
/// @issue 54636

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
  const c1 = C() as C;
  const c2 = C() as M;
  const c3 = E.e1 as E;
  const c4 = C<int>() as C<num>;
  const c5 = C<int>() as CNumAlias;
  const c6 = IntET1(1) as IntET2Alias;
  const c7 = IntET2(1) as IntET1Alias;

  const fo1 = C() as FutureOr<C>;
  const fo2 = C() as FutureOr<M>;
  const fo3 = E.e1 as FutureOr<E>;
  const fo4 = C<int>() as FutureOr<C<num>>;
  const fo5 = C<int>() as FutureOr<CNumAlias>;
  const fo6 = IntET1(1) as FutureOr<IntET2Alias>;
  const fo7 = IntET2(1) as FutureOr<IntET1Alias>;

  const f1 = foo as void Function();
  const f2 = as as void Function();
  const f3 = (bar<int>) as int Function(int);

  const d = 2 as dynamic;

  Expect.identical(c1, c2);
  Expect.identical(E.e1, c3);
  Expect.identical(c4, c5);
  Expect.identical(c6, c7);
  Expect.identical(fo1, fo2);
  Expect.identical(E.e1, fo3);
  Expect.identical(fo4, fo5);
  Expect.identical(fo6, fo7);
  Expect.identical(foo, f1);
  Expect.identical(as, f2);
  Expect.identical(bar<int>, f3);
  Expect.identical(2, d);
}
