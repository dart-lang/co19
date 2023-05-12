// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Many combinations don't make sense:
/// ...
/// - sealed types already cannot be mixed in, extended or implemented from
/// another library, so it's redundant to combine with final, base, or interface
///
/// @description Check that it is a compile time error to combine modifier
/// `sealed` with `final`, `base`, or `interface` modifiers
/// @author sgrekhov22@gmail.com

  sealed final class SealedFinal {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final sealed class FinalSealed {}
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  sealed base class SealedBase {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  base sealed class BaseSealed {}
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

  sealed interface class SealedInterface {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  interface sealed class InterfaceSealed {}
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(SealedFinal);
  print(FinalSealed);
  print(SealedBase);
  print(BaseSealed);
  print(SealedInterface);
  print(InterfaceSealed);
}
