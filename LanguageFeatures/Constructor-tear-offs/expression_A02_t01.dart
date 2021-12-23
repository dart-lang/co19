// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For an expression of the form e<typeArgs>, which is not followed
/// by an argument list (that would turn it into a generic function invocation),
/// the meaning of e<typeArgs> depends on the expression e:
/// ...
/// - If e denotes a generic top-level, static or local function declaration
/// (again e is an identifier or qualified identifier), that declaration must be
/// a generic function declaration, and then e<typeArgs> performs an explicitly
/// instantiated function tear-off, which works just like the current implicitly
/// instantiated function tear-off except that the types are provided instead of
/// inferred.
///
/// @description Checks that if e denotes a generic top-level, static or local
/// function declaration then that declaration must be a generic function
/// declaration, and then e<typeArgs> performs an explicitly instantiated
/// function tear-off
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  static void foo1<X>(X x) {}
}

typedef CAlias = C;

void foo2<T>(T t) {}

main() {
  void foo3<T>(T t) {}

  var c1 = C.foo1<int>;
  Expect.isFalse(c1 is Type);
  Expect.isTrue(c1 is void Function(int));
  Expect.runtimeIsNotType<Type>(c1);
  Expect.runtimeIsType<void Function(int)>(c1);

  var c2 = CAlias.foo1<String>;
  Expect.isFalse(c2 is Type);
  Expect.isTrue(c2 is void Function(String));
  Expect.runtimeIsNotType<Type>(c2);
  Expect.runtimeIsType<void Function(String)>(c2);

  var c3 = foo2<bool>;
  Expect.isFalse(c3 is Type);
  Expect.isTrue(c3 is void Function(bool));
  Expect.runtimeIsNotType<Type>(c3);
  Expect.runtimeIsType<void Function(bool)>(c3);

  var c4 = foo3<double>;
  Expect.isFalse(c4 is Type);
  Expect.isTrue(c4 is void Function(double));
  Expect.runtimeIsNotType<Type>(c4);
  Expect.runtimeIsType<void Function(double)>(c4);
}
