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

typedef int Foo(int i);

class A {
  T foo<T>(T value) => value;
}

class C extends A {
  Foo getCall1() => super.foo.call<int>;
  Foo getCall2() => super.foo.call;
}

main() {
  C c = new C();
  Expect.equals(42, c.getCall1()(42));
  Expect.equals(42, c.getCall2()(42));
}
