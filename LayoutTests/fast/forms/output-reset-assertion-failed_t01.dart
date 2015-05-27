/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Ensures that assertion failures don't occur on updating the
 * value of <output> elements.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  debug('- A test in the value is set twice.');
  var output = document.createElement('output');
  document.body.append(output);
  output.value = '';
  output.value = '';
  testPassed('Not crashed');
  output.remove();

  debug('');
  debug('- A test in the value is set to different values twice.');
  output = document.createElement('output');
  document.body.append(output);
  output.value = '';
  output.value = 'foo';
  testPassed('Not crashed');
  output.remove();

  debug('');
  debug('- A test in reset events occur twice when there is no default value.');
  var form = document.createElement('form');
  document.body.append(form);
  output = document.createElement('output');
  form.append(output);
  form.reset();
  form.reset();
  testPassed('Not crashed');
  form.remove();

  debug('');
  debug('- A test in reset events occur twice when the value is the same as the default value.');
  form = document.createElement('form');
  document.body.append(form);
  output = document.createElement('output');
  output.defaultValue = 'foo';
  output.value = 'foo';
  form.append(output);
  form.reset();
  form.reset();
  testPassed('Not crashed');
  form.remove();
}
