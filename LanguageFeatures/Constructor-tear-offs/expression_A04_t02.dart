// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For an expression of the form e<typeArgs>, which is not followed
/// by an argument list (that would turn it into a generic function invocation),
/// the meaning of e<typeArgs> depends on the expression e:
/// ...
/// - If e has a static type which is a generic callable object type (a
/// non-function type with a generic method named call), then e<typeArgs> is
/// equivalent to the instantiated method-tear off e.call<typeArgs>.
///
/// @description Checks that if `e` denotes a generic instance method, then
/// `e<typeArgs>` performs an explicitly instantiated method tear-off.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class A {}

mixin M {
  T call<T>(T t) => t;
}

class C = A with M;

main() {
  var c = C();
  var c1 = c<int>;
  Expect.isFalse(c1 is Type);
  Expect.isTrue(c1 is int Function(int));
  Expect.runtimeIsNotType<Type>(c1);
  Expect.runtimeIsType<void Function(int)>(c1);
  Expect.equals(c1, c.call<int>);
}
