// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We do not allow implicit instantiation of callable objects. Given
/// e<typeArgs> where e has a static type which is a class with a generic call
/// method, we do not implicitly convert this to e.call<typeArgs>, like we would
/// for a call like e<typeArgs>(args). You cannot type-instantiate function
/// values, only call them, and here we treat "callable objects" like function
/// values. You can write e.call<typeArgs> and treat call as a normal generic
/// instance method.
///
/// @description Checks that in case of e.call<typeArgs> call  is treated as a
/// normal generic instance method.
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

typedef int Func(int i);

class C {
  T call<T extends num>(T t) => t;
}

main() {
  var c = C().call<int>;
  Expect.isTrue(c is Func);
  Expect.equals(42, c(42));
}
