// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base mixin class can be extended and mixed in but not
/// constructed, implemented and is not exhaustive
///
/// @description Checks that it is a compile-time error to tear off constructor
/// of an `abstract base mixin class`
/// @author sgrekhov22@gmail.com

abstract base mixin class AbstractBaseMixinClass {
  AbstractBaseMixinClass();
  AbstractBaseMixinClass.x();
}

main() {
  var tf1 = AbstractBaseMixinClass.new;
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var tf2 = AbstractBaseMixinClass.x;
//          ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
