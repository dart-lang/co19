/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test verifies that the internal conversion from UTF16 to
 * utf8 is robust to invalid inputs. Any DOM entry point which converts an
 * incoming string to utf8 could be used for this test.
 */
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  var array = [];
  array.add(new String.fromCharCode(0x48)); // H
  array.add(new String.fromCharCode(0x69)); // i
  array.add(new String.fromCharCode(0xd87e)); // Bogus
  var string = array.join('');

  // In order to make this test not depend on WebGL, the following were
  // attempted:
  //  - Send a string to console.log
  //  - Submit a mailto: form containing a text input with the bogus
  //    string
  // The first code path does not perform a utf8 conversion of the
  // incoming string unless Console::shouldPrintExceptions() returns
  // true. The second seems to sanitize the form's input before
  // converting it to a utf8 string.

  var gl = create3DContext(null);
  var program = gl.createProgram();
  gl.bindAttribLocation(program, 0, string);
  testPassed("bindAttribLocation with invalid UTF-16 did not crash");
}
