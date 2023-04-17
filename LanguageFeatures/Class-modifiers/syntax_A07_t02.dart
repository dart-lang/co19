// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Many combinations don't make sense:
/// ...
/// - mixin as a modifier cannot be applied to a mixin-application class
///   declaration (the class C = S with M; syntax for declaring a class). The
///   remaining modifiers can.
///
/// @description Check that `abstract`, `sealed`, `base`, `interface` and
/// `final` modifier can be added to a mixin-application class declaration
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

class C {}

mixin M1 {}

mixin class M2 {}

abstract class AbstractClass = C with M1;

sealed class SealedClass = C with M2;

base class BaseClass = C with M1;

interface class InterfaceClass = C with M2;

final class FinalClass = C with M1;

main() {
  print(AbstractClass);
  print(SealedClass);
  print(BaseClass);
  print(InterfaceClass);
  print(FinalClass);
}
