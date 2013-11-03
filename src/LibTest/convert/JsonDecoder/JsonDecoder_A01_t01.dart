/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const JsonDecoder(reviver(key, value))
 * Constructs a new JsonDecoder.
 * The reviver may be null.
 * @description Checks that this constructor executes without error for various arguments.
 * @author kaigorodov
 */

import "dart:convert";

main() {
  JsonDecoder jdec=new JsonDecoder(null);
  JsonDecoder jdec2=new JsonDecoder((key, value){});
}
