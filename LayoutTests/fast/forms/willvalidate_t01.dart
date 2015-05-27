/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for .willValidate property
 * @static-warning
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var parent = document.createElement('div');
  document.body.append(parent);

  debug('Existence of .willValidate');
  parent.setInnerHtml('<form>'
    + '<input name="victim"/>'
    + '<textarea name="victim"></textarea>'
    + '<fieldset name="victim">Test</fieldset>'
    + '<button name="victim">'
    + '<select name="victim"></select>'
    + '<output name="victim"></output>'
    + '<object name="victim"></object>'
    + '<keygen name="victim">'
    + '</form>',
    treeSanitizer: new NullTreeSanitizer());
  var controls = document.getElementsByName('victim');
  for (var i = 0; i < controls.length; i++)
    shouldBeTrue(controls[i].willValidate is bool);

  debug('');
  debug('Form association');
  parent.innerHtml = '<input name="test">';
  var input = document.getElementsByTagName("input")[0];
  shouldBeTrue(input.willValidate);
  parent.innerHtml = '<form><input name="test"></form>';
  input = document.getElementsByTagName("input")[0];
  shouldBeTrue(input.willValidate);

  debug('');
  debug('Control name');
  parent.innerHtml = '<form><input></form>';
  input = document.getElementsByTagName("input")[0];
  shouldBeTrue(input.willValidate);
  parent.innerHtml = '<form><input name="test"></form>';
  input = document.getElementsByTagName("input")[0];
  shouldBeTrue(input.willValidate);

  debug('');
  debug('Disabled control');
  parent.innerHtml = '<form><input name="test" disabled></form>';
  input = document.getElementsByTagName("input")[0];
  shouldBeFalse(input.willValidate);

  debug('');
  debug('Read-only control');
  parent.innerHtml = '<form><input name="test" readonly></form>';
  input = document.getElementsByTagName("input")[0];
  shouldBeFalse(input.willValidate);

  debug('');
  debug('Input types');
  parent.innerHtml = '<form><input name="test"></form>';
  input = document.getElementsByTagName("input")[0];
  shouldBeTrue(input.willValidate);
  input.type = "button"; shouldBeFalse(input.willValidate);
  input.type = "submit"; shouldBeTrue(input.willValidate);
  input.type = "hidden"; shouldBeFalse(input.willValidate);
  input.type = "reset"; shouldBeFalse(input.willValidate);

  debug('');
  debug('Fieldset element');
  parent.innerHtml = '<form><fieldset><p>Fieldset test</p></fieldtset></form>';
  shouldBeFalse(document.getElementsByTagName("fieldset")[0].willValidate);

  debug('');
  debug('Textarea element');
  parent.innerHtml = '<form><textarea name="text"></textarea></form>';
  shouldBeTrue(document.getElementsByTagName("textarea")[0].willValidate);

  debug('');
  debug('Output element');
  parent.innerHtml = '<form><output></output></form>';
  shouldBeFalse(document.getElementsByTagName("output")[0].willValidate);

  debug('');
  debug('Object element');
  parent.setInnerHtml('<form><object></object></form>', treeSanitizer: new NullTreeSanitizer());
  shouldBeFalse(document.getElementsByTagName("object")[0].willValidate);

  debug('');
  debug('Keygen element');
  parent.setInnerHtml('<form><keygen></form>',treeSanitizer: new NullTreeSanitizer());
  shouldBeFalse(document.getElementsByTagName("keygen")[0].willValidate);
}
