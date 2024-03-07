// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that DV is an extension type declaration named Name, and
/// V1 occurs as one of the <type>s in the <interfaces> of DV. In this case we
/// say that V1 is a superinterface of DV.
/// ...
/// Assume that DV is an extension type declaration named Name, and the type V1,
/// declared by DV1, is a superinterface of DV (V1 could be an extension type or
/// a non-extension type). Let m be the name of a member of V1. If DV also
/// declares a member named m then the latter may be considered similar to a
/// declaration that "overrides" the former. However, it should be noted that
/// extension type method invocation is resolved statically, and hence there is
/// no override relationship among the two in the traditional object-oriented
/// sense (that is, it will never occur that the statically known declaration is
/// the member of V1, and the member invoked at run time is the one in DV). A
/// receiver with static type V1 will invoke the declaration in DV1, and a
/// receiver with a static type which is a reference to DV (like Name or
/// Name<...>) will invoke the one in DV.
///
/// Hence, we use a different word to describe the relationship between a member
/// named m of a superinterface, and a member named m which is declared by the
/// subinterface: We say that the latter redeclares the former.
///
/// In particular, if two different declarations of m are inherited from two
/// superinterfaces then the subinterface can resolve the conflict by
/// redeclaring m.
///
/// There is no notion of having a 'correct override relation' here. With
/// extension types, any member signature can redeclare any other member
/// signature with the same name, including the case where a method is
/// redeclared by a getter, or vice versa.
///
/// @description Checks that if the right overridden method is called
/// @author sgrekhov22@gmail.com
/// @issue 53740

import "../../Utils/expect.dart";

class A {
  String foo() => "A";
}

class B implements A {
  @override
  String foo([int i = 0]) => "B";
}

extension type ET1(B b) implements A {}

extension type ET2(B b) implements ET1, B {}

extension type ET3(B b) implements B, ET1 {}

void main() {
  ET1 et1 = ET1(B());
  ET2 et2 = ET2(B());
  ET3 et3 = ET3(B());

  Expect.equals("B", et1.foo());
  Expect.equals("B", et2.foo());
  Expect.equals("B", et3.foo());

  Expect.equals("B", et2.foo(42));
  Expect.equals("B", et3.foo(42));
}
