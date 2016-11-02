/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests type enforcement on DOM setters.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  // NodeList is not a Node, so document.body can't be set to one.
  dynamic nodelist = document.getElementsByName('sillypants');
  shouldThrow(() => document.body = nodelist);

  // NodeList is also not an HTMLTableSectionElement.
  dynamic table = document.createElement('table');
  shouldThrow(() => table.tHead = nodelist);
}
