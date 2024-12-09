// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting generative constructor marked `augment` adds its
/// redirection to the augmented constructor.
///
/// This converts it into a redirecting generative constructor, removing the
/// potentially non-redirecting property of the constructor.
///
/// @description Checks that an augmenting redirecting generative constructor
/// may replace existing redirecting initializer of the augmented constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_constructors_A17_t02_lib.dart';

class C {
  int x;
  C(this.x);
  C.foo(int x) : this(x + 1);
  C.bar(int x) : this(x + 1);
}

enum E {
  e0(0), e1.foo(1), e2.foo(2);
  final int x;
  const E(this.x);
  const E.foo(int x): this(x + 1);
  const E.bar(int x): this(x + 1);
}

extension type ET(int x) {
  ET.foo(int x): this(x + 1);
  ET.bar(int x): this(x + 1);
}

main() {
  Expect.equals(3, C.bar(1).x);
  Expect.equals(3, E.e2.x);
  Expect.equals(3, ET.bar(1).x);
}
