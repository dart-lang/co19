// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not an error for an extension type member to have the
/// modifier external
///
/// @description Checks that it is not an error for an extension type member to
/// have the modifier `external`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET1<T>(T id) {
  external T get getter;
}

extension type ET2(int id) {
  external void setter(int x);
}

extension type ET3<T extends num>(T id) {
  external void method();
}

extension type ET4(int id) {
  external int operator +(int other);
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
