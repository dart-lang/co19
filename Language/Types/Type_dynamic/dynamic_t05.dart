/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The name dynamic denotes a Type object even though dynamic is
 * not a class.
 * @description Checks that type of object 'dynamic' is subtype of Type.
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(dynamic is Type);
}
