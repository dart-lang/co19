/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description A Test for sending a reset event to output elements.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var form = document.createElement('form');
  var output = document.createElement('output');
  output.defaultValue = 'defaultValue';
  form.append(output);

  debug('- Sets the value attribute of the output element.');
  output.value = 'aValue';
  shouldBeEqualToString(output.defaultValue, 'defaultValue');
  shouldBeEqualToString(output.value, 'aValue');
  shouldBeEqualToString(output.text, 'aValue');
  shouldBeEqualToString(output.innerHtml, 'aValue');

  debug('- Sends a reset event to reset the value to the default value.');
  form.reset();
  shouldBeEqualToString(output.defaultValue, 'defaultValue');
  shouldBeEqualToString(output.value, 'defaultValue');
  shouldBeEqualToString(output.text, 'defaultValue');
  shouldBeEqualToString(output.innerHtml, 'defaultValue');

  debug('- Ensures that the value mode flags is in mode "default".');
  output.defaultValue = 'another defaultValue';
  shouldBeEqualToString(output.defaultValue, 'another defaultValue');
  shouldBeEqualToString(output.value, 'another defaultValue');
  shouldBeEqualToString(output.text, 'another defaultValue');
  shouldBeEqualToString(output.innerHtml, 'another defaultValue');
}
