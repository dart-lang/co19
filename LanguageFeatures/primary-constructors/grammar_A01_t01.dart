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

class C1;

class C2();

class C3(var int v);

base class C4(var int v);

final class C5(var int v);

mixin class C6;

abstract class C7(var int v);

sealed class C8(var int v);

extension type ET1(int v);

class const C11;

class const C12();

class const C13(final int v);

base class const C14(final int v);

final class const C15(final int v);

mixin class const C16;

abstract class C17(final int v);

sealed class C18(final int v);

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
  print(C12());
  Expect.equals(1, C13(1).v);
  Expect.equals(2, C14(2).v);
  Expect.equals(3, C15(3).v);
  print(C16);
  print(C17);
  print(C18);
  Expect.equals(0, ET2(0).v);
}
