// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not an error for an extension type member to have the
/// modifier external
///
/// @description Checks that it is not an error for an extension type static
/// member to have the modifier `external`
/// @author sgrekhov22@gmail.com

extension type ET1(int id) {
  external static int m;
}

extension type ET2<T>(T id) {
  external static int get getter;
}

extension type ET3(int id) {
  external static void setter(int x);
}

extension type ET4<T extends num>(T id) {
  external static void method();
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
