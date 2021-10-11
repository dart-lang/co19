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
/// @description Checks that if e denotes a generic instance method then then
/// e<typeArgs> performs an explicitly instantiated method tear-off
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  T call<T>(T t) => t;
}

typedef CAlias = C;

main() {
  var c = C();
  var c1 = c<int>;
  Expect.isFalse(c1 is Type);
  Expect.isTrue(c1 is int Function(int));
  Expect.equals(c1, c.call<int>);

  var ca = CAlias();
  var c2 = ca<int>;
  Expect.isFalse(c2 is Type);
  Expect.isTrue(c2 is int Function(int));
  Expect.equals(c2, ca.call<int>);
}
