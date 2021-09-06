// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Currently you can do instantiated tear-offs of instance methods.
/// We restrict that to interface methods, which precisely excludes the call
/// methods of function types. We do not allow instantiating function values,
/// and therefore also cannot allow side-stepping that restriction by
/// instantiation the .call "instance" method of such a value.
///
/// That makes it a compile-time error to explicitly instantiate the call method
/// of an expression with a function type or of type Function, and the tear-off
/// of a call method of a function type is not subject to implicit instantiation
/// (so the tear-off is always generic, even if the context type requires it not
/// to be, which is then guaranteed to introduce a type error).
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
