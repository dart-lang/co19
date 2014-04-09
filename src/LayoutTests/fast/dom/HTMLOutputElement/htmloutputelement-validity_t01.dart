/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for the validation APIs of output elements.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var container;
  var output;

  container = document.createElement('div');
  document.body.append(container);

  debug('- Ensures whether the willValidate is defined and it always returns false.');
  container.innerHtml = '<form><output id="outputElement">aValue</output></form>';
  output = document.getElementById('outputElement');
  shouldBeTrue(output.willValidate is bool);
  shouldBeFalse(output.willValidate);
  container.innerHtml = '<output id="outputElement">aValue</output>';
  output = document.getElementById('outputElement');
  shouldBeFalse(output.willValidate);

  debug('- Ensures validity is always "valid" and validationMessage() always returns an empty string.');
  container.innerHtml = '<form><output id="outputElement">aValue</output></form>';
  output = document.getElementById('outputElement');
  shouldBeEqualToString(output.validationMessage, '');
  shouldBeTrue(output.checkValidity());
  output.setCustomValidity('This should not be affected.');
  shouldBeEqualToString(output.validationMessage, '');
  shouldBeTrue(output.checkValidity());
}
