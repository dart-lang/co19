// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Final class can be constructed but not extended, implemented or
/// mixed in and is not exhaustive
///
/// @description Checks that it is not an error to declare a `base mixin` on a
/// `final class` in the same library where it is defined
/// @author sgrekhov22@gmail.com

final class FinalClass {}

base mixin BaseMixinOnFinalClass on FinalClass {}

main() {
  print(BaseMixinOnFinalClass);
}
