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
/// generic function type
/// @author sgrekhov@unipro.ru
/// @issue 46902

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  static T staticMethod<T>(T value) => value;
  T instanceMethod<T>(T value) => value;
}

main() {
  var funcValue1 = C.staticMethod;
  T Function<T>(T) f1 = funcValue1.call;
  Expect.equals(42, f1<int>(42));
  Expect.equals(3.14, f1<double>(3.14));
  Expect.equals("Lily was here", funcValue1.call<String>("Lily was here"));

  C c = new C();
  var funcValue2 = c.instanceMethod;
  T Function<T>(T) f2 = funcValue2.call;
  Expect.equals(42, f2<int>(42));
  Expect.equals(3.14, f2<double>(3.14));
  Expect.equals("Lily was here", funcValue2.call<String>("Lily was here"));
}
