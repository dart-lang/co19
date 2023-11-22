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
/// @description Checks that it is a compile-time error if an extension type
/// declaration `DV` includes a member that conflicts with other ones
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(int id) {
  external int id2; // id2 here declares a setter with conflicts with V2.id2()
}

extension type V2(int id) {
  int id2() => id;
}

extension type ET(int id) implements V1, V2 {
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET);
}
