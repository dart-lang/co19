/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <select id="test" size="3" multiple="multiple">
    </select>
    <div id="console"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  reset(mySelect) {
    mySelect.innerHtml = '';
    mySelect.multiple = true;
    mySelect.append(
        new OptionElement(data: "one", value: "value", selected: false));
    mySelect.append(
        new OptionElement(data: "two", value: "value", selected: false));
  }

  var mySelect = document.getElementById("test");
  reset(mySelect);
  var i = 0;

  // We use this local variable as shouldBe will modify the dom tree version. Any dom tree version update invalidates
  // the caches therefore we need to make sure that we store the values before calling shouldBe.
  var selectedOptions;
  var optionsLength = 0;

  debug((++i).toString() + ") Initial there is no selected options.");
  optionsLength = mySelect.options.length;
  selectedOptions = (mySelect.selectedOptions);
  shouldBe(optionsLength, 2);
  shouldBe(selectedOptions.length, 0);

  debug((++i).toString() + ") Select an option should update the selected options collection.");
  mySelect.options[0].selected = true;
  optionsLength = mySelect.options.length;
  selectedOptions = (mySelect.selectedOptions);
  shouldBe(optionsLength, 2);
  shouldBe(selectedOptions.length, 1);
  shouldBe(selectedOptions[0].text, 'one');

  debug((++i).toString() + ") Select two options should update the selected options collection.");
  mySelect.options[1].selected = true;
  optionsLength = mySelect.options.length;
  selectedOptions = (mySelect.selectedOptions);
  shouldBe(optionsLength, 2);
  shouldBe(selectedOptions.length, 2);
  shouldBe(selectedOptions[0].text, 'one');
  shouldBe(selectedOptions[1].text, 'two');

  debug((++i).toString() + ") Unselect an option should update the selected options collection.");
  mySelect.options[0].selected = false;
  optionsLength = mySelect.options.length;
  selectedOptions = (mySelect.selectedOptions);
  shouldBe(optionsLength, 2);
  shouldBe(selectedOptions.length, 1);
  shouldBe(selectedOptions[0].text, 'two');

  reset(mySelect);
  debug((++i).toString() + ") Even with an option disabled selectedOptions should be updated.");
  mySelect.options[0].disabled = true;
  mySelect.options[0].selected = true;
  optionsLength = mySelect.options.length;
  selectedOptions = (mySelect.selectedOptions);
  shouldBe(optionsLength, 2);
  shouldBe(selectedOptions.length, 1);
  shouldBe(selectedOptions[0].text, 'one');

  debug((++i).toString() + ") Even with select element disabled, the selectedOptions should be updated.");
  mySelect.disabled = true;
  mySelect.options[1].selected = true;
  optionsLength = mySelect.options.length;
  selectedOptions = (mySelect.selectedOptions);
  shouldBe(optionsLength, 2);
  shouldBe(selectedOptions.length, 2);
  shouldBe(selectedOptions[0].text, 'one');
  shouldBe(selectedOptions[1].text, 'two');
}
