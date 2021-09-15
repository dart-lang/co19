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
/// @description Check implicitly introduced constructors of the mixin
/// application are constant expressions according to the same rules as regular
/// tear-offs
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class A<X> {
  final X x;
  const A.named(this.x);
  const A(this.x);
}

mixin M {}

class C<X> = A<X> with M;

main() {
  foo<Y>() {
    const c1 = C<Y>.named;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

    const c2 = C<Y>.new;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
