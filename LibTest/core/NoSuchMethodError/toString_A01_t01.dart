// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Undocumented
/// @description Checks that this method causes no error and the result is not
/// null and is indeed a String.
/// @author rodionov

import "../../../Utils/expect.dart";

main() {
  var symb = new Symbol('');
  NoSuchMethodError e = new NoSuchMethodError.withInvocation(
      null, Invocation.method(symb, [], {}));
  Expect.isTrue(e.toString().isNotEmpty);
  Expect.isTrue(e.toString() is String);
  Expect.runtimeIsType<String>(e.toString());
}
