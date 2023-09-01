// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let D be a late and final local variable declaration that
/// declares a variable v. If an object o is assigned to v in a situation where
/// v is unbound then v is bound to o. If an object o is assigned to v in a
/// situation where v is bound to an object o′ then a dynamic error occurs (it
/// does not matter whether o is the same object as o′).
///
/// @description Checks that if an object `o` is assigned to a late final local
/// variable `v` in a situation where `v` is unbound then `v` is bound to `o`
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class C {
  int id;
  C(this.id);
}

main()  {
  C c1 = C(1);
  late final v1 = c1;
  Expect.identical(c1, v1);

  C c2 = C(2);
  late final v2;
  v2 = c2;
  Expect.identical(c2, v2);
}
