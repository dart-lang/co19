/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const bool.fromEnvironment(
 * String name, {
 * bool defaultValue: false
 * })
 * Returns the boolean value of the environment declaration name
 * @description Checks that this constructor returns false if there is no
 * environment variable with appropriate name
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

const ENV_VAR = "SOME_ENV_VARIABLE";

main() {
  var b = const bool.fromEnvironment(ENV_VAR);
  Expect.isFalse(b);
}
