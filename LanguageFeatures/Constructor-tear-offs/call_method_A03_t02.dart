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
/// - Otherwise, if e has a static type which is a generic function type, then
/// e<typeArgs> is equivalent to the instantiated method-tear off
/// e.call<typeArgs>
///
/// @description Checks that it is not an error to tear-off a call method of a
/// generic function type using super.
/// @author sgrekhov@unipro.ru
/// @issue 46902

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class A {
  T foo<T>(T value) => value;
}

class C extends A {
  test() {
    T Function<T>(T) f1 = super.foo.call;
    Expect.equals(42, f1<int>(42));
    Expect.equals(3.14, f1<double>(3.14));

    var funcVal = super.foo;
    T Function<T>(T) f2 = funcVal.call;
    Expect.equals(42, f2<int>(42));
    Expect.equals(3.14, f2<double>(3.14));
  }
}

main() {
  C c = new C();
  c.test();
}
