// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, in an extension declaration that has an on-declaration.
///
/// @description Checks that that it is still an error to declare a redirecting
/// factory constructor in an extension declaration on an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

enum E() {
  e0();
}

extension Ext1 on E {
  factory() = E.new;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2 on E {
  factory someName() = E.new;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E);
}
