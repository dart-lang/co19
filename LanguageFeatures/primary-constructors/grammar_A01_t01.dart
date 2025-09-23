// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class declaration whose class body is `;` is treated as a class
/// declaration whose class body is `{}`.
///
/// @description Check that a class or an extension type declaration whose body
/// is `;` is treated as a class declaration whose class body is `{}`.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

class C;

class C0();

class C1(var int v);

base class C2(var int v);

final class C3(var int v);

mixin class C4(var int v);

abstract class C5(var int v);

sealed class C6(var int v);

extension type ET(var int v);

main() {
  print(C);
  print(C0());
  Expect.equals(1, C1(1).v);
  Expect.equals(2, C2(2).v);
  Expect.equals(3, C3(3).v);
  Expect.equals(4, C4(4).v);
  print(C5);
  print(C6);
  Expect.equals(0, ET(0).v);
}
