// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, in an extension declaration that has an on-declaration.
///
/// @description Checks that that it is a compile-time error if a redirecting
/// factory constructor in an extension redirects to a constructor that does not
/// exist.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C.other() {}

mixin class MC.other() {}

extension type ET.other(int id) implements num {}

extension Ext1 on C {
  factory() = C.missing;
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2 on C {
  factory someName() = C.missing;
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext3 on MC {
  factory() = MC.missing;
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext4 on MC {
  factory someName() = MC.missing;
//                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext5 on ET {
  factory() = ET.missing;
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext6 on ET {
  factory someName() = ET.missing;
//                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(MC);
  print(ET);
}
