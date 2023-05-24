// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract mixin class can be extended, implemented and mixed in
/// but not constructed and is not exhaustive
///
/// @description Checks that it is a compile-time error to tear off constructor
/// of an `abstract mixin class`
/// @author sgrekhov22@gmail.com

abstract mixin class AbstractMixinClass {
  AbstractMixinClass();
  AbstractMixinClass.x();
}

main() {
  var tf1 = AbstractMixinClass.new;
//          ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var tf2 = AbstractMixinClass.x;
//          ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
