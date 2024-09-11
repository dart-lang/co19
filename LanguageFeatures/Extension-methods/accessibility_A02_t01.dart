// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a deferred import declaration
/// imports a library with an extension declaration in its export scope, unless
/// all such extensions are hidden by a `hide` combinator with the extension's
/// name, or a `show` combinator without the extension's name, on the deferred
/// import.
///
/// @description Check that it is a compile-time error if a deferred import
/// declaration imports a library with an extension declaration in its export
/// scope.
/// @author sgrekhov22@gmail.com

import 'accessibility_lib.dart' deferred as p;
//     ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
