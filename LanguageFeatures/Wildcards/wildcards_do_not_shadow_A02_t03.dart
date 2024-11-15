// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Here is an interesting example:
/// ```
/// class C {
///   var _ = 'field';
///
///   test() {
///     var _ = 'local';
///
///     _ = 'assign';
///   }
/// }
/// ```
/// This program is valid and assigns to the field, not the local.
///
/// @description Checks that a type named `_` can be assigned to a local
/// variable named `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class _ {}

main() {
  var _ = _;
  Expect.isTrue(_ is Type);
}
