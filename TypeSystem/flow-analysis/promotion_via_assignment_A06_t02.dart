// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a variable `x` is promotable via assignment of an
/// expression of type `T` given variable model `VM` if
/// - `VM = VariableModel(declared, promoted, tested, assigned, unassigned,
///     captured)`
/// - and captured is false
/// - and `S` is the current type of `x` in `VM`
/// - and `T <: S` and not `S <: T`
/// - and `T` is a type of interest for `x` in `tested`
///
/// @description Checks static type of a variable after assignment with a
/// supertype of the declared type as type of interest. Test the "diamond"
/// inheritance.
/// @author sgrekhov22@gmail.com
/// @issue 60622

import '../../Utils/static_type_helper.dart';

class A {}
class B extends A {}
class C extends A {}
class D implements B, C {}

void test(Object a, D d){
  a as A;
  if (a is B || a is C) {}
  a = d; // Not promoted: Neither `B` nor `C` is minimal in `{A, B, C}`.
  a.expectStaticType<Exactly<A>>();
}

main() {
  test(A(), D());
}
