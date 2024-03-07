// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that DV is an extension type declaration named Name, and
/// V1 occurs as one of the <type>s in the <interfaces> of DV. In this case we
/// say that V1 is a superinterface of DV.
///
/// A compile-time error occurs if V1 is a type name or a parameterized type
/// which occurs as a superinterface in an extension type declaration DV, and V1
/// denotes a non-extension type which is not a supertype of the representation
/// type of DV.
///
/// @description Checks that it is a compile-time error if superinterface of an
/// extension type `DV` is not a supertype of the representation type of `DV`.
/// @author sgrekhov22@gmail.com

class V1 {}
class V2<T1, T2> {}

extension type ET0(int id) {}

extension type ET1(int id) implements V1 {}
//                                    ^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2(ET0 id) implements V1 {}
//                                    ^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET3<T1, T2 extends num?>(T1 id) implements V2<T1, T2> {}
//                                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET4<T1, T2 extends num?>(ET0 id) implements V2<T1, T2> {}
//                                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
