// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, or a redirecting generative constructor in an extension
/// declaration that has an on-declaration (defined later in this section), and
/// both kinds can be constant or not.
///
/// @description Checks that that it is not a compile-time error to declare a
/// non-constant constant redirecting generative constructor in an extension
/// declaration on an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

enum E {
  e0(0);

  final int v;
  const E(this.v);
}

extension ExtE on E {
  E.baz() : this(1);
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E);
}
