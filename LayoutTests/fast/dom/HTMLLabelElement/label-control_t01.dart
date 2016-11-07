/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that label.control references the correct form control,
 * or null if there is no associated control.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {

  add(html) {
    document.body.append(new DocumentFragment.html(html));
  }

  debug("Find a control that is the first descendent in a label");
  add("<label id='test1'><input id='inputId1'></label>");
  shouldBe(
      (document.getElementById('test1')as LabelElement).control.id, 'inputId1');

  debug("Find a control based on a label with valid 'for' attribute");
  add("<label id='test2' for='inputId2'></label><input id='inputId2' type='number'>");
  LabelElement label = document.getElementById('test2');
  shouldBe(label.htmlFor, 'inputId2');
  shouldBe((label.control as InputElement).type, 'number');

  debug("Find a control in p element in label");
  add("<label id='test3'><p><input id='inputId3' type='date'></p></label>");
  shouldBe((document.getElementById('test3') as LabelElement).control.id,
      'inputId3');

  debug("Find a control in fieldset in label.");
  //debug("Note that filedset is a form control that is not labelable.");
  add("<label id='test4'><fieldset><input id='inputId4'></fieldset></label>");
  shouldBe((document.getElementById('test4') as LabelElement).control.id,
      'inputId4');

  debug("Find a control in legend in label.");
  //debug("Note that legend is a form control that is not labelable.");
  add("<label id='test5'><legend><input id='inputId5'></legend></label>");
  shouldBe((document.getElementById('test5') as LabelElement).control.id,
      'inputId5');

  debug("Find a control in optgroup in label.");
  //debug("Note that optgroup is a form control that is not labelable.");
  add("<label id='test6'><optgroup><input id='inputId6'></optgroup></label>");
  shouldBe((document.getElementById('test6') as LabelElement).control.id,
      'inputId6');

  debug("Find a control in option in label.");
  //debug("Note that option is a form control that is not labelable.");
  add("<label id='test7'><option><input id='inputId7'></option></label>");
  shouldBe((document.getElementById('test7') as LabelElement).control.id,
      'inputId7');

  debug("Test label with 'for' attribute which is not a valid element id");
  add("<label for='foo' id='test8'><input id='inputId8'></label>");
  shouldBe((document.getElementById('test8') as LabelElement).control, null);

  debug("Test label with 'for' attribute which is not a form control");
  add("<label for='divId' id='test9'><input id='inputId9'></label><div id='divId'></div>");
  label = document.getElementById('test9');
  shouldBe(label.htmlFor, 'divId');
  shouldBe(label.control, null);

  debug("Test label with 'for' attribute which is not a labelable form control - fieldset");
  add("<label for='fsId' id='test10'><input id='inputId10'></label><fieldset id='fsId'></fieldset>");
  label = document.getElementById('test10');
  shouldBe(label.htmlFor, 'fsId');
  shouldBe(label.control, null);

  debug("Test label with 'for' attribute which is not a labelable form control - legend");
  add("<label for='legendId' id='test11'><input id='inputId11'></label><legend id='legendId'></legend>");
  label = document.getElementById('test11');
  shouldBe(label.htmlFor, 'legendId');
  shouldBe(label, null);

  debug("Test label with 'for' attribute which is not a labelable form control - optgroup");
  add("<label for='optgroupId' id='test12'><input id='inputId12'></label><optgroup id='optgroupId'></optgroup>");
  label = document.getElementById('test12');
  shouldBe(label.htmlFor, 'optgroupId');
  shouldBe(label.control, null);

  debug("Test label with 'for' attribute which is not a labelable form control - option");
  add("<label for='optionId' id='test13'><input id='inputId13'></label><option id='optionId'></option>");
  label = document.getElementById('test13');
  shouldBe(label, 'optionId');
  shouldBe(label.control, null);
}

