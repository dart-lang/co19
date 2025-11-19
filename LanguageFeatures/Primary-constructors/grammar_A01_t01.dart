// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, mixin class, or extension type declaration whose body is
/// `;` is treated as the corresponding declaration whose body is `{}` and
/// otherwise the same. This rule is not applicable to a
/// `<mixinApplicationClass>` (for instance, `class B = A with M;`).
///
/// @description Check that a class, mixin, or extension type declaration whose
/// body is `;` is treated as a declaration whose body is `{}`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C1;

class C2();

class C3(var int v);

base class C4(var int v);

final class C5(var int v);

mixin class C6;

abstract class C7(var int v);

sealed class C8(var int v);

extension type ET1(int v);

class const C11();

class const C12(final int v);

base class const C13(final int v);

final class const C14(final int v);

abstract class const C15(final int v);

sealed class const C16(final int v);

extension type const ET2(int v);

main() {
  print(C1);
  print(C2());
  Expect.equals(1, C3(1).v);
  Expect.equals(2, C4(2).v);
  Expect.equals(3, C5(3).v);
  print(C6);
  print(C7);
  print(C8);
  Expect.equals(0, ET1(0).v);

  print(C11);
  Expect.equals(1, C12(1).v);
  Expect.equals(2, C13(2).v);
  Expect.equals(3, C14(3).v);
  Expect.equals(4, C15(4).v);
  print(C16);
  Expect.equals(0, ET2(0).v);
}
