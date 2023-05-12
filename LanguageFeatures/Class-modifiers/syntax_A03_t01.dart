// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Many combinations don't make sense:
/// - base, interface, and final all control the same two capabilities so are
///   mutually exclusive.
///
/// @description Check that `base`, `interface`, and `final` modifiers are
/// mutually exclusive
/// @author sgrekhov22@gmail.com

  base interface class BaseInterface {}
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

  base final class BaseFinal {}
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

  interface base class InterfaceBase {}
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  interface final class InterfaceFinal {}
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final interface class FinalInterface {}
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final base class FinalBase {}
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(BaseInterface);
  print(BaseFinal);
  print(InterfaceBase);
  print(InterfaceFinal);
  print(FinalInterface);
  print(FinalBase);
}
