// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Because of that, we introduce a [new] syntax that can be used to
/// denote the unnamed constructor: [C.new]. It can be used in every place where
/// a named constructor can be referenced, but will instead denote the unnamed
/// constructor, and it can be used to tear off the unnamed constructor without
/// interfering with using the class name to denote the [Type] object.
///
///    class C {
///      final int x;
///      const C.new(this.x); // declaration.
///    }
///
///    class D extend C {
///      D(int x) : super.new(x * 2); // super constructor reference.
///    }
///
///    void main() {
///      D.new(1); // normal invocation.
///      const C.new(1); // const invocation.
///      new C.new(1); // explicit new invocation.
///      var f = C.new; // tear-off.
///      f(1);
///    }
///  }
///
/// @description Checks the example from the Spec.
///
/// @Issue 46198
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class C {
  final int x;
  const C.new(this.x);
}

class D extends C {
  D(int x) : super.new(x * 2);
}

void main() {
  D d = D.new(1);
  Expect.equals(d.x, 2);

  const c = C.new(3);
  Expect.equals(c.x, 3);

  var c1 = new C.new(7);
  Expect.equals(c1.x, 7);

  var f = C.new;
  int i = f(-1).x;
  Expect.equals(i, -1);
}
