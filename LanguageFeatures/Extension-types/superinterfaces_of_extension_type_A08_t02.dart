// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if two elements in the type list of
/// the `implements` clause of an extension type declaration specifies the same
/// type.
///
/// @description Checks that it is not an error if two elements in the type list
/// of the `implements` clause of an extension type declaration specifies
/// different types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

class A<T> {}

extension type IntET(int _) implements int {}

extension type ET<T extends num>(T _) implements num {}

extension type ET1(int _) implements num, int {}

extension type ET2(IntET _) implements IntET, int {}

extension type ET3(IntET _) implements IntET, ET<int> {}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
}
