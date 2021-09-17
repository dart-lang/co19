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

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

T foo<T>(T t) => t;

main() {
  T bar<T>(T t) => t;

  var c1 = foo<int>;
  Expect.isFalse(c1 is Type);
  Expect.isTrue(c1 is int Function(int));
  Expect.equals(c1.toString(), foo.call<int>.toString());

  var c2 = bar<int>;
  Expect.isFalse(c2 is Type);
  Expect.isTrue(c2 is int Function(int));
  Expect.equals(c2.toString(), bar.call<int>.toString());
}
