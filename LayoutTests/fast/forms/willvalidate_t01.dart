/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for .willValidate property
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  DivElement parent = document.createElement('div') as DivElement;
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
  List<Node> controls = document.getElementsByName('victim');
  for (int i = 0; i < controls.length; i++)
    shouldBeTrue((controls[i] as dynamic).willValidate is bool);

  debug('');
  debug('Form association');
  parent.innerHtml = '<input name="test">';
  InputElement input = document.getElementsByTagName("input")[0] as InputElement;
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
  shouldBeFalse((document.getElementsByTagName("fieldset")[0] as FieldSetElement).willValidate);

  debug('');
  debug('Textarea element');
  parent.innerHtml = '<form><textarea name="text"></textarea></form>';
  shouldBeTrue((document.getElementsByTagName("textarea")[0] as TextAreaElement).willValidate);

  debug('');
  debug('Output element');
  parent.innerHtml = '<form><output></output></form>';
  shouldBeFalse((document.getElementsByTagName("output")[0] as OutputElement).willValidate);

  debug('');
  debug('Object element');
  parent.setInnerHtml('<form><object></object></form>', treeSanitizer: new NullTreeSanitizer());
  shouldBeFalse((document.getElementsByTagName("object")[0] as ObjectElement).willValidate);

  debug('');
  debug('Keygen element');
  parent.setInnerHtml('<form><keygen></form>',treeSanitizer: new NullTreeSanitizer());
  shouldBeFalse((document.getElementsByTagName("keygen")[0] as KeygenElement).willValidate);
}
