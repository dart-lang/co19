/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test passes if it does not crash
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var template = document.createElement('template');
  var content = template.content;
  template = null;
  content.append(document.createElement('div'));
}
