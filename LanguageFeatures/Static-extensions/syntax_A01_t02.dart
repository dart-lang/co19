// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, or a redirecting generative constructor in an extension
/// declaration that has an on-declaration (defined later in this section), and
/// both kinds can be constant or not.
///
/// @description Checks that that it is a compile-time error to declare a
/// redirecting generative constructor in an extension declaration that has no
/// on-declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C {}

extension type ET(int v) {}

enum E {
  e0;
  const E();
}

extension Ext1 {
  C.foo() : this();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2 {
  ET.foo(int v) : this();
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext3 {
  const E.foo() : this();
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
  print(E);
}
