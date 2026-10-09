// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, in an extension declaration that has an on-declaration.
///
/// @description Checks that that it is still an error to declare a factory
/// constructor in an extension declaration on a mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

mixin M1 {}
mixin M2 {}

class C1 = Object with M1;
class C2 = Object with M2;

extension Ext1 on M1 {
  factory() => C1();
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2 on M1 {
  factory someName() => C1();
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext3 on M2 {
  factory() = C2.new;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext4 on M2 {
  factory someName() = C2.new;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(M1);
  print(M2);
}
