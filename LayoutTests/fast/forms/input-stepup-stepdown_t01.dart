/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check stepUp() and stepDown() bahevior for unsupported types.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

_shouldThrow(func())
  => shouldThrow(func, (e) => e is DomException && e.name == DomException.INVALID_STATE);

main() {
  var input = document.createElement('input');

  input.type = 'text';
  input.step = "3";
  input.min = "";
  input.max = "";
  input.value = "2";
  _shouldThrow(() => input.stepDown());
  _shouldThrow(() => input.stepDown(0));
  _shouldThrow(() => input.stepUp());
  _shouldThrow(() => input.stepUp(0));
}
