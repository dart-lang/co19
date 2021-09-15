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
/// @description Check that explicitly instantiated tear-off of the mixin
/// application forwarding constructor has correct type
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

class A<X> {
  X x;
  A.named(this.x);
  A(this.x);
}

mixin M {}

class C<X> = A<X> with M;

main() {
  var f1 = C<int>.named;
  C c1 = f1(42);
  C c2 = f1("Lily was here");
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var f2 = C<int>.new;
  C c3 = f2(42);
  C c4 = f2("Lily was here");
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
