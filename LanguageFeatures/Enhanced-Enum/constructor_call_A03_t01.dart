// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to refer to a declared or default
/// generative constructor of an enum declaration in any way, other than:
/// - As the target of a redirecting generative constructor of the same enum
///   declaration (: this(...);/: this.targetName(...);), or
/// - Implicitly in the enum value declarations of the same enum
///   (enumValueName(args)/enumValueName.targetName(args)).
///
/// @description Check that it’s not an error to call a declared or default
/// generative constructor as a target of a redirection or implicitly in the
/// enum value declarations of the same enum
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

enum E {
  e1(1),
  e2.named(2),
  e3.test1(3),
  e4.test2(4);

  const E(this.i);
  const E.named(int i) : this.i = i;

  const E.test1(int i) : this(i);
  const E.test2(int i) : this.named(i);

  final int i;
}

main() {
  Expect.equals(1, E.e1.i);
  Expect.equals(2, E.e2.i);
  Expect.equals(3, E.e3.i);
  Expect.equals(4, E.e4.i);
}
