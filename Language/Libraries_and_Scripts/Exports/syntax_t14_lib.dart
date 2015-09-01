/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library Export_test_lib;
@meta @meta2() export "syntax_lib.dart";

const meta = "meta!";

class meta2 {
  const meta2();
}
