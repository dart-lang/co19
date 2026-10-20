// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an extension declares a constructor
/// which is generative.
///
/// @description Checks that it is a compile-time error if an extension declares
/// a generative constructor. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

enum E {
  e0.named();

  E.named();
}

extension Ext1E on E {
  new();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2E on E {
  const foo();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext3E on E {
  const new() : this.named();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext4E on E {
  E() : this.named();
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext5E on E {
  E.bar();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E);
}
