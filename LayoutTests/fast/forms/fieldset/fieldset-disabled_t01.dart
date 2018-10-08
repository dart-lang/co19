/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for HTMLFieldSetElement.disabled behavior.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  DocumentFragment f = new DocumentFragment.html('''
      <style type="text/css">
      input {
          background:rgb(255,255,100);
      }
      input:disabled {
          background:rgb(255,0,0);
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div id="console"></div>
      <form>
      <fieldset>
      <legend><input type="text" id="parserGeneratedInput1"></legend>
      <legend><input type="text" id="parserGeneratedInput2"></legend>
      <input type="text" id="parserGeneratedInput3">
      <input type="text" id="parserGeneratedInput4" disabled>
      </fieldset>
      <fieldset disabled>
      <legend><input type="text" id="parserGeneratedInput5"></legend>
      <legend><input type="text" id="parserGeneratedInput6"></legend>
      <input type="text" id="parserGeneratedInput7">
      <input type="text" id="parserGeneratedInput8" disabled>
      </fieldset>
      <fieldset disabled>
      <input type="text" id="parserGeneratedInput9">
      </fieldset>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug('\nVerifying parser generated fieldsets.');
  InputElement parserGeneratedInput1 = document.getElementById("parserGeneratedInput1") as InputElement;
  InputElement parserGeneratedInput2 = document.getElementById("parserGeneratedInput2") as InputElement;
  InputElement parserGeneratedInput3 = document.getElementById("parserGeneratedInput3") as InputElement;
  InputElement parserGeneratedInput4 = document.getElementById("parserGeneratedInput4") as InputElement;
  InputElement parserGeneratedInput5 = document.getElementById("parserGeneratedInput5") as InputElement;
  InputElement parserGeneratedInput6 = document.getElementById("parserGeneratedInput6") as InputElement;
  InputElement parserGeneratedInput7 = document.getElementById("parserGeneratedInput7") as InputElement;
  InputElement parserGeneratedInput8 = document.getElementById("parserGeneratedInput8") as InputElement;
  InputElement parserGeneratedInput9 = document.getElementById("parserGeneratedInput9") as InputElement;

  parserGeneratedInput1.focus();
  document.execCommand('insertText', false, 'L');
  parserGeneratedInput2.focus();
  document.execCommand('insertText', false, 'M');
  parserGeneratedInput3.focus();
  document.execCommand('insertText', false, 'N');
  parserGeneratedInput4.focus();
  document.execCommand('insertText', false, 'O');
  parserGeneratedInput5.focus();
  document.execCommand('insertText', false, 'P');
  parserGeneratedInput6.focus();
  document.execCommand('insertText', false, 'Q');
  parserGeneratedInput7.focus();
  document.execCommand('insertText', false, 'R');
  parserGeneratedInput8.focus();
  document.execCommand('insertText', false, 'S');
  parserGeneratedInput9.focus();
  document.execCommand('insertText', false, 'T');

  shouldBe(parserGeneratedInput1.value, "L");
  shouldBe(parserGeneratedInput2.value, "M");
  shouldBe(parserGeneratedInput3.value, "NO");
  shouldBe(parserGeneratedInput4.value, "");
  shouldBe(parserGeneratedInput5.value, "PQRST");
  shouldBe(parserGeneratedInput6.value, "");
  shouldBe(parserGeneratedInput7.value, "");
  shouldBe(parserGeneratedInput8.value, "");
  shouldBe(parserGeneratedInput9.value, "");

  debug('\nTesting a single fieldset element.');
  FieldSetElement fieldSet = document.createElement('fieldset') as FieldSetElement;
  document.body.append(fieldSet);
  InputElement textInput = document.createElement('input') as InputElement;
  textInput.type = "text";
  fieldSet.append(textInput);

  debug('Verifying HTMLFormControl can be disabled regardless of enclosing fieldset.');
  textInput.disabled = true;
  shouldBeTrue(textInput.disabled);
  textInput.focus();
  document.execCommand('insertText', false, 'A');
  shouldBe(textInput.value, "");
  shouldBeFalse(fieldSet.disabled);
  textInput.disabled = false;

  debug('Fieldset is enabled by default. A user can insertText into the text input field.');
  textInput.focus();
  document.execCommand('insertText', false, 'A');
  shouldBe(textInput.value, "A");

  debug('Disable fieldset.');
  fieldSet.disabled = true;
  shouldBeTrue(fieldSet.disabled);

  debug('Once the fieldset is disabled, text cannot be inserted.');
  textInput.focus();
  document.execCommand('insertText', false, 'B');
  shouldBe(textInput.value, "A");

  debug("Check if the style of the text element changed.");
  shouldBe(getComputedStyle(textInput).backgroundColor, "rgb(255, 0, 0)");

  debug('Enable fieldset.');
  fieldSet.disabled = false;
  shouldBeFalse(fieldSet.disabled);
  shouldBe(getComputedStyle(textInput).backgroundColor, "rgb(255, 255, 100)");

  textInput.focus();
  document.execCommand('insertText', false, 'B');
  shouldBe(textInput.value, "AB");

  debug('Move the textinput element out of the fieldset.');
  textInput.remove();
  document.body.append(textInput);

  debug('Disable the fieldset.');
  fieldSet.disabled = true;
  shouldBeTrue(fieldSet.disabled);

  debug('Text can be inserted, because the textinput element is outside of the disabled fieldset.');
  textInput.focus();
  document.execCommand('insertText', false, 'C');
  shouldBe(textInput.value, "ABC");

  debug('Enable the fieldset.');
  fieldSet.disabled = false;
  shouldBeFalse(fieldSet.disabled);

  debug('Insert a table into the fieldset.');
  TableElement table = document.createElement('table') as TableElement;
  fieldSet.append(table);
  TableRowElement tr = document.createElement('tr') as TableRowElement;
  table.append(tr);
  TableCellElement td = document.createElement('td') as TableCellElement;
  tr.append(td);

  debug('Move the textinput field into the table.');
  textInput.remove();
  td.append(textInput);

  textInput.focus();
  document.execCommand('insertText', false, 'D');
  shouldBe(textInput.value, "ABCD");

  debug('Disable the fieldset.');
  fieldSet.disabled = true;
  shouldBeTrue(fieldSet.disabled);

  debug('Inserting text should fail.');
  textInput.focus();
  document.execCommand('insertText', false, 'E');
  shouldBe(textInput.value, "ABCD");

  debug('Enable the fieldset.');
  fieldSet.disabled = false;
  shouldBeFalse(fieldSet.disabled);

  textInput.focus();
  document.execCommand('insertText', false, 'E');
  shouldBe(textInput.value, "ABCDE");


  debug('\nTesting nested fieldset elements.');
  FieldSetElement outerFieldSet = document.createElement('fieldset') as FieldSetElement;
  document.body.append(outerFieldSet);
  FieldSetElement innerFieldSet = document.createElement('fieldset') as FieldSetElement;
  outerFieldSet.append(innerFieldSet);
  InputElement outerTextInput = document.createElement('input') as InputElement;
  outerTextInput.type = "text";
  outerFieldSet.append(outerTextInput);
  InputElement innerTextInput = document.createElement('input') as InputElement;
  innerTextInput.type = "text";
  innerFieldSet.append(innerTextInput);

  debug('Verifying that subordinates of both fieldsets are enabled.');
  outerTextInput.focus();
  document.execCommand('insertText', false, 'F');
  innerTextInput.focus();
  document.execCommand('insertText', false, 'F');
  shouldBe(outerTextInput.value, "F");
  shouldBe(innerTextInput.value, "F");

  debug('Disabling the inner fieldset only.');
  innerFieldSet.disabled = true;
  shouldBeTrue(innerFieldSet.disabled);
  outerTextInput.focus();
  document.execCommand('insertText', false, 'G');
  innerTextInput.focus();
  document.execCommand('insertText', false, 'G');
  shouldBe(outerTextInput.value, "FGG");
  shouldBe(innerTextInput.value, "F");

  debug('Enabling the inner and disabling the outer fieldset.');
  outerFieldSet.disabled = true;
  innerFieldSet.disabled = false;
  shouldBeTrue(outerFieldSet.disabled);
  shouldBeFalse(innerFieldSet.disabled);
  outerTextInput.focus();
  document.execCommand('insertText', false, 'H');
  innerTextInput.focus();
  document.execCommand('insertText', false, 'H');
  shouldBe(outerTextInput.value, "FGG");
  shouldBe(innerTextInput.value, "F");

  debug('Disabling both fieldset elements.');
  outerFieldSet.disabled = true;
  innerFieldSet.disabled = true;
  shouldBeTrue(outerFieldSet.disabled);
  shouldBeTrue(innerFieldSet.disabled);
  outerTextInput.focus();
  document.execCommand('insertText', false, 'H');
  innerTextInput.focus();
  document.execCommand('insertText', false, 'H');
  shouldBe(outerTextInput.value, "FGG");
  shouldBe(innerTextInput.value, "F");

  debug('Enabling both fieldset elements.');
  outerFieldSet.disabled = false;
  innerFieldSet.disabled = false;
  shouldBeFalse(outerFieldSet.disabled);
  shouldBeFalse(innerFieldSet.disabled);
  outerTextInput.focus();
  document.execCommand('insertText', false, 'H');
  innerTextInput.focus();
  document.execCommand('insertText', false, 'H');
  shouldBe(outerTextInput.value, "FGGH");
  shouldBe(innerTextInput.value, "FH");

  debug('\nTest behavior of the first legend element in a fieldset elements.');
  FieldSetElement legendFieldSet = document.createElement('fieldset') as FieldSetElement;
  document.body.append(legendFieldSet);
  LegendElement firstLegend = document.createElement('legend') as LegendElement;
  legendFieldSet.append(firstLegend);
  LegendElement secondLegend = document.createElement('legend') as LegendElement;
  legendFieldSet.append(secondLegend);

  InputElement firstLegendTextInput = document.createElement('input') as InputElement;
  firstLegendTextInput.type = "text";
  firstLegend.append(firstLegendTextInput);

  InputElement secondLegendTextInput = document.createElement('input') as InputElement;
  secondLegendTextInput.type = "text";
  secondLegend.append(secondLegendTextInput);

  debug('Children of the first legend element in a fieldset should not get disabled with the fieldset.');
  legendFieldSet.disabled = true;
  shouldBeTrue(legendFieldSet.disabled);
  firstLegendTextInput.focus();
  document.execCommand('insertText', false, 'I');
  secondLegendTextInput.focus();
  document.execCommand('insertText', false, 'I');
  shouldBe(firstLegendTextInput.value, "II");
  shouldBe(secondLegendTextInput.value, "");

  debug('Insert another legend element before the currently first one, and check again.');
  LegendElement insertedLegend = document.createElement('legend') as LegendElement;
  legendFieldSet.insertBefore(insertedLegend, firstLegend);
  InputElement insertedLegendTextInput = document.createElement('input') as InputElement;
  insertedLegend.append(insertedLegendTextInput);

  insertedLegendTextInput.focus();
  document.execCommand('insertText', false, 'J');
  firstLegendTextInput.focus();
  document.execCommand('insertText', false, 'J');
  secondLegendTextInput.focus();
  document.execCommand('insertText', false, 'J');
  shouldBe(insertedLegendTextInput.value, "JJJ");
  shouldBe(firstLegendTextInput.value, "II");
  shouldBe(secondLegendTextInput.value, "");

  debug('Enable the fieldset again and check for sanity.');
  legendFieldSet.disabled = false;
  shouldBeFalse(legendFieldSet.disabled);
  insertedLegendTextInput.focus();
  document.execCommand('insertText', false, 'K');
  firstLegendTextInput.focus();
  document.execCommand('insertText', false, 'K');
  secondLegendTextInput.focus();
  document.execCommand('insertText', false, 'K');
  shouldBe(insertedLegendTextInput.value, "JJJK");
  shouldBe(firstLegendTextInput.value, "IIK");
  shouldBe(secondLegendTextInput.value, "K");
}
