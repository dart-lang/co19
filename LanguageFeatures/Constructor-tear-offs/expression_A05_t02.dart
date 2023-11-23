// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For an expression of the form e<typeArgs>, which is not followed
/// by an argument list (that would turn it into a generic function invocation),
/// the meaning of e<typeArgs> depends on the expression e:
/// ...
/// - Otherwise, if e has a static type which is a generic function type, then
/// e<typeArgs> is equivalent to the instantiated method-tear off
/// e.call<typeArgs>.
///
/// @description Checks that if e has a static type which is a generic function
/// type, then e<typeArgs> is equivalent to the instantiated method-tear off
/// e.call<typeArgs>
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C {
  static T foo<T>(T t) => t;
  T bar<T>(T t) => t;
}
main() {
  var c1 = C.foo<int>;
  Expect.isFalse(c1 is Type);
  Expect.isTrue(c1 is int Function(int));
  Expect.runtimeIsNotType<Type>(c1);
  Expect.runtimeIsType<void Function(int)>(c1);
  Expect.equals(c1.toString(), C.foo.call<int>.toString());

  C c = new C();
  var c2 = c.bar<int>;
  Expect.isFalse(c2 is Type);
  Expect.isTrue(c2 is int Function(int));
  Expect.runtimeIsNotType<Type>(c2);
  Expect.runtimeIsType<void Function(int)>(c2);
  Expect.equals(c2.toString(), c.bar.call<int>.toString());
}
