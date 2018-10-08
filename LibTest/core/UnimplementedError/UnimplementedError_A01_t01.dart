/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented: const UnimplementedError()
 * @description Checks that this constructor executes without error.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  UnimplementedError ue1 = new UnimplementedError();
  Expect.isNull(ue1.message);

  UnimplementedError ue2 = new UnimplementedError("Unimplented test");
  Expect.equals("Unimplented test", ue2.message);
}
