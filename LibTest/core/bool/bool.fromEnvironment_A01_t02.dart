/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const bool.fromEnvironment(
 * String name, {
 * bool defaultValue: false
 * })
 * Returns the boolean value of the environment declaration name
 * @description Checks that this constructor returns true if there is
 * environment variable with the appropriate name and value "true"
 * @author sgrekhov@unipro.ru
 */
import 'dart:io';
import "../../../Utils/expect.dart";

main() {
  Map<String, String> env = Platform.environment;

  env.keys.forEach((k) {
    var val = new bool.fromEnvironment(k);
    if (env[k] == "true") {
      Expect.isTrue(val, "Wrong value for name $k");
    } else {
      Expect.isFalse(val, "Wrong value for name $k");
    }
  });
}
