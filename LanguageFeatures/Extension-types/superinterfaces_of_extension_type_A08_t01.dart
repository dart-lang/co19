// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if two elements in the type list of
/// the `implements` clause of an extension type declaration specifies the same
/// type.
///
/// @description Checks that it is a compile-time error if two elements in the
/// type list of the `implements` clause of an extension type declaration
/// specifies the same type.
/// @author sgrekhov22@gmail.com
/// @issue 53790, 53791

class A {}

class B<T> {}

extension type IntET(int _) implements int {}

extension type ET<T extends num>(T _) implements num {}

extension type ET1(A _) implements A, A {}
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2(B<int> _) implements B<int>, B<int> {}
//                                              ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET3(IntET _) implements IntET, int, IntET {}
//                                                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET4<T extends num>(B<T> _) implements B<T>, B<T> {}
//                                                         ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET5<T extends num>(T _) implements ET<T>, ET<T> {}
//                                                       ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
}
