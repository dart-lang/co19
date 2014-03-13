/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that a range input's slider is cloned along with its 
 * host. There should be a second range input in the document and it should
 * have a slider positioned at zero.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
      <input type="range" id="sheep" style="display: block; width: 100px;">
      ''', treeSanitizer: new NullTreeSanitizer());

  var sheep = document.querySelector('#sheep');
  var dolly = sheep.clone(false);
  
  sheep.insertAdjacentElement('afterEnd', dolly);

  // Cloned element should be the same size. Having zero height is one
  // symptom of a broken clone.
  Expect.equals(sheep.clientHeight, dolly.clientHeight);

  dolly.value = '0';
}
