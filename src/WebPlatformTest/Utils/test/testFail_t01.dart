/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description test just fails
 */
import "../expectWeb.dart";

main() {

test(() {
  Expect.fail("as designed");
}, "designed to fail");

checkTestFailures();
}
