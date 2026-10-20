 // Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an extension declares a constructor
/// which is generative.
///
/// @description Checks that it is a compile-time error if an extension declares
/// a generative constructor. Test a generative constructor that uses the name
 /// of the extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C {}

extension Ext1C on C {
  Ext1C();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2C on C {
  Ext2C() {}
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext3C on C {
  Ext3C.someName() {}
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext4C on C {
  const Ext4C._();
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class MC {}

extension Ext1MC on MC {
  Ext1MC();
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2MC on MC {
  Ext2C.someName();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext3MC on MC {
  const Ext3MC._();
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
}

extension Ext1E on E {
  Ext1E();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2E on E {
  Ext2E.someName();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext3E on E {
  const Ext3E._();
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {}

extension Ext1ET on ET {
  Ext1ET(this._);
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2ET on ET {
  Ext2ET(int _) {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext3ET on ET {
  Ext3ET.someName(int x) : this(x) {}
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext4ET on ET {
  const Ext4ET._(this._);
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(MC);
  print(E);
  print(ET);
}
