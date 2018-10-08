/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test using id in frame
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  var parent = document.createElement('iframe');
  parent.id = 'theframe';
  document.body.append(parent);

  Expect.isNotNull(document.getElementById("theframe"));
}
