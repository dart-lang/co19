// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A mixin application introduces forwarding constructors for
/// accessible superclass constructors. Those implicitly introduced constructors
/// are subject to constructor tear-off in the same way as if they had been
/// declared explicitly, and they are constant expressions according to the same
/// rules.
///
/// Example:
///
/// class A<X> {
///   A.named();
///   A();
/// }
/// mixin M {}
/// class B<X> = A<X> with M;
///
/// void main() {
///   const f = B.named; // Uninstantiated tear-off.
///   var g = B<int>.new; // Explicitly instantiated tear-off.
/// }
///
/// @description Check example from the Spec.
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class A<X> {
  X x;
  A.named(this.x);
  A(this.x);
}

mixin M {}

class C<X> = A<X> with M;

main() {
  const f1 = C.named;
  C c1 = f1("Lily was here");
  Expect.equals("Lily was here", c1.x);
  C c2 = f1(42);
  Expect.equals(42, c2.x);

  const f2 = C<int>.named;
  C c3 = f2(42);
  Expect.equals(42, c3.x);

  var f3 = C.new;
  C c4 = f3("Lily was here");
  Expect.equals("Lily was here", c4.x);
  C c5 = f3(42);
  Expect.equals(42, c5.x);

  var f4 = C<int>.new;
  C c6 = f4(42);
  Expect.equals(42, c6.x);
}
