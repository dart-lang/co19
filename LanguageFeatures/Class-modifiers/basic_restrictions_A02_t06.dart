// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A class extends or mixes in a declaration marked interface or final from
///   another library.
///
/// @description Check that it is not an error if class marked
/// `abstract interface` is extended in the same library where it is declared
/// @author sgrekhov22@gmail.com

abstract interface class AbstractInterfaceClass {}

class ExtendsInterface extends AbstractInterfaceClass {}

base class BaseExtendsInterface extends AbstractInterfaceClass {}

interface class InterfaceExtendsInterface extends AbstractInterfaceClass {}

final class FinalExtendsInterface extends AbstractInterfaceClass {}

sealed class SealedExtendsInterface extends AbstractInterfaceClass {}

abstract class AbstractExtendsInterface extends AbstractInterfaceClass {}

abstract base class AbstractBaseExtendsInterface
    extends AbstractInterfaceClass {}

abstract interface class AbstractInterfaceExtendsInterface
    extends AbstractInterfaceClass {}

abstract final class AbstractFinalExtendsInterface
    extends AbstractInterfaceClass {}

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
