// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an extension type declaration DV named Name with
/// representation name id and representation type R. Invocation of a
/// non-redirecting generative extension type constructor proceeds as follows:
/// A fresh, non-late, final variable v is created. An initializing formal
/// this.id has the side-effect that it initializes v to the actual argument
/// passed to this formal. An initializer list element of the form id = e or
/// this.id = e is evaluated by evaluating e to an object o and binding v to o.
/// During the execution of the constructor body, this and id are bound to the
/// value of v. The value of the instance creation expression that gave rise to
/// this constructor execution is the value of this.
///
/// @description Check evaluation of an initializer list with a cascade
/// expressions
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

extension type ET1(List<int> id)  {
  ET1.pair(int v1, int v2) : this.id = []
    ..add(v1)
    ..add(v2);
}

main() {
  var et = ET1.pair(1, 2);
  Expect.listEquals([1, 2], et);
}
