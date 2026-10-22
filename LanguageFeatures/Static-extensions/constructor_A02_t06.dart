// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an extension declares a constructor
/// which is generative.
///
/// @description Checks that it is a compile-time error if an extension declares
/// a generative constructor. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

extension type ET1.foo(int id) {
  ET1.named(int id) : this.foo(id);
}

extension ExtET1 on ET1 {
  new(this.id) {}
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(int id) {
  ET2.named(int id) : this._(id);
}

extension Ext1ET2 on ET2 {
  new(int id) : this.named(id);
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET3._(int id) {
  const ET3.named(int id) : this._(id);
}

extension Ext1ET3 on ET3 {
  const new(this.id);
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
}
