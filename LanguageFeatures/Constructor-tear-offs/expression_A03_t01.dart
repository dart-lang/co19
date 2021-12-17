// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For an expression of the form e<typeArgs>, which is not followed
/// by an argument list (that would turn it into a generic function invocation),
/// the meaning of e<typeArgs> depends on the expression e:
/// ...
/// - If e denotes a generic instance method (e has the form r.name and r has a
/// static type for which name is a generic interface method), then e<typeArgs>
/// performs an explicitly instantiated method tear-off, which works just like
/// the current implicitly instantiated method tear-off except that the types
/// are provided instead of inferred.
///
/// @description Checks that if e denotes a generic instance method then then
/// e<typeArgs> performs an explicitly instantiated method tear-off
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  void foo1<X>(X x) {}
}

typedef CAlias = C;

main() {
  var c1 = C().foo1<int>;
  Expect.isFalse(c1 is Type);
  Expect.isTrue(c1 is void Function(int));
  checkType(checkIs<Type>, false, c1);
  checkType(checkIs<void Function(int)>, true, c1);

  var c2 = CAlias().foo1<String>;
  Expect.isFalse(c2 is Type);
  Expect.isTrue(c2 is void Function(String));
  checkType(checkIs<Type>, false, c2);
  checkType(checkIs<void Function(String)>, true, c2);
}
