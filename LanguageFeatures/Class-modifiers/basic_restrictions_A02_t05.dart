// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A class extends or mixes in a declaration marked interface or final from
///   another library.
///
/// @description Check that it is not an error if class marked `interface` is
/// extended in the same library where it is declared
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

interface class InterfaceClass {}

class ExtendsInterface extends InterfaceClass {}

base class BaseExtendsInterface extends InterfaceClass {}

interface class InterfaceExtendsInterface extends InterfaceClass {}

final class FinalExtendsInterface extends InterfaceClass {}

sealed class SealedExtendsInterface extends InterfaceClass {}

abstract class AbstractExtendsInterface extends InterfaceClass {}

abstract base class AbstractBaseExtendsInterface extends InterfaceClass {}

abstract interface class AbstractInterfaceExtendsInterface
    extends InterfaceClass {}

abstract final class AbstractFinalExtendsInterface extends InterfaceClass {}

main() {
  print(ExtendsInterface);
  print(BaseExtendsInterface);
  print(InterfaceExtendsInterface);
  print(FinalExtendsInterface);
  print(SealedExtendsInterface);
  print(AbstractExtendsInterface);
  print(AbstractBaseExtendsInterface);
  print(AbstractInterfaceExtendsInterface);
  print(AbstractFinalExtendsInterface);
}
