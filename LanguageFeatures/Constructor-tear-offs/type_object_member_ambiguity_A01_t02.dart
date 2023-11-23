// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Constructor/type object member ambiguity
/// Until now, writing C.foo means that foo must be a static member of C. If you
/// write C.toString(), then it's interpreted as trying to call a static
/// toString method on the class C, not the instance toString method of the Type
/// object for the class C. You have to write (C).toString() if that is what you
/// want.
///
/// Similarly, we always treat C<T>.toString() as an attempted constructor
/// invocation, not an invocation of the instance toString method of the Type
/// object corresponding to C<T> (which is now otherwise a valid expression).
///
/// That is, disambiguation of the otherwise grammatically ambiguous
/// "(instantiated class-reference or type-literal).name" always chooses the
/// "constructor tear-off" interpretation over the "type-literal instance
/// member" interpretation. If followed by an argument list, it's always treated
/// as a constructor invocation, not the (now otherwise allowed) Type object
/// instance method invocation. This is a generalization of what we already do
/// for static members and for constructor invocations.
///
/// @description Checks that C<T>.toString() is treated as a constructor
/// invocation, not as a call ot Type.toString()
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C<T> {
  C.toString() {}
}

main() {
  Expect.isTrue(C<int>.toString() is C);
  Expect.isTrue((C<int>).toString() is String);
  Expect.runtimeIsType<C>(C<int>.toString());
  Expect.runtimeIsType<String>((C<int>).toString());
}
