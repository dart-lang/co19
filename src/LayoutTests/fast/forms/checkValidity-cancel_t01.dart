/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for checkValidity() with invalid event canceling
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var parent = document.createElement('div');
  document.body.append(parent);
  parent.innerHtml = '<form><input name=i required></form>';
  var form = parent.firstChild;
  var input = form.firstChild;

  debug('"invalid" event is not canceled.');
  var invalidFired  = false;
  nothingListener(event) {
    invalidFired = true;
  }
  input.addEventListener("invalid", nothingListener, false);
  shouldBeTrue(!input.checkValidity() && invalidFired);
  invalidFired = false;
  shouldBeTrue(!form.checkValidity() && invalidFired);
  input.removeEventListener('invalid', nothingListener, false);
  
  debug('');
  debug('"invalid" event is canceled.');
  invalidFired = false;
  cancelListener(event) {
    invalidFired = true;
    event.preventDefault();
  }
  // Even if 'invalid' is canceled, the input.checkValidity() result is still false.
  input.addEventListener("invalid", cancelListener, false);
  shouldBeTrue(!input.checkValidity() && invalidFired);
  // form.checkValidity() also should be false.
  invalidFired = false;
  shouldBeTrue(!form.checkValidity() && invalidFired);
}
