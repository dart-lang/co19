// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The declared type of a local variable with a declaration of one
/// of the forms late? var v = e; late? final v = e; const v = e; is determined
/// as follows:
/// ...
/// • Otherwise, the declared type of v is the static type of e.
///
/// @description Checks that static type of a variable declared by the
/// statements `late? var v = e; late? final v = e; const v = e;` is the static
/// type of `e`. Check that `v` is not erroneously promoted
/// @author sgrekhov22@gmail.com

import '../../../Utils/static_type_helper.dart';

test<T>(T t) {
  if (t is int) {
  }
  late final v = t;
  v.isEven;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test<num>(3.14);
}
