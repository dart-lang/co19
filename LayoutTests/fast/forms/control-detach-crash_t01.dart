/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  // We had an assertion failure in FormController::unregisterFormElementWithState.
  var d = document.createElement('div');
  var s = document.createElement('script');
  s.text = 'document.currentScript.parentNode.remove();';
  d.append(s);
  d.append(document.createElement('input'));
  document.body.append(d);
  document.body.innerHtml = 'PASS';
}
