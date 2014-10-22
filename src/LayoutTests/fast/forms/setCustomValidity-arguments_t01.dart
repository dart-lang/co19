/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test how setCustomValidity reacts to too few arguments.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var b = document.createElement('button');
  shouldThrow(() => b.setCustomValidity());
  var fs = document.createElement('fieldset');
  shouldThrow(() => fs.setCustomValidity());
  var i = document.createElement('input');
  shouldThrow(() => i.setCustomValidity());
  var k = document.createElement('keygen');
  shouldThrow(() => k.setCustomValidity());
}
