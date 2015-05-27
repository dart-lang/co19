/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test will try to call blur() on a contenteditable div, 
 * and then a normal div.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="mydiv" style="border-style:solid" contenteditable>contentEditable div</div>
    <div id="result"></div>
    <div id="exc"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var result;
  var pass1;
  var pass2;
  var pass3;
  var exceptions;

  pass1 = true;
  pass2 = true;
  pass3 = false;
  exceptions = "";

  document.getElementById('mydiv').onBlur.listen((_) => pass3 = true);

  try {
    document.getElementById('mydiv').focus();
    document.getElementById('mydiv').blur();
  } catch(e) {
    exceptions += "Exception: $e\n";
    pass1 = false;
  }

  try {
    document.getElementById('result').blur();
  } catch(e) {
    exceptions += "Exception: $e\n";
    pass2 = false;
  }

  if (pass1 && pass2 && pass3) {
    result = "Test Passed.";
  } else {
    result = "Test Failed.";
  }

  document.getElementById('result').innerHtml = result;
  document.getElementById('exc').innerHtml = exceptions;

  shouldBeTrue(pass1 && pass2 && pass3);
}
