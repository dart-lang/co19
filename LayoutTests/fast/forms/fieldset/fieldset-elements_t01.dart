/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test the elements attibute of HTMLFieldSet element.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  DivElement container = document.createElement('div') as DivElement;
  document.body.append(container);

  container.setInnerHtml('<form id=formElement> <fieldset id="fs">' +
      '<button id=button1></button>' +
      '<fieldset id=fieldset1><legend id=legend1></legend></fieldset>' +
      '<div> <input id=inputhidden type=hidden> </div>' +
      '<input id=inputtext type=text>' +
      '<input id=inputsearch type=search>' +
      '<input id=inputurl type=url>' +
      '<input id=inputemail type=email>' +
      '<input id=inputpassword type=password>' +
      '<input id=inputdate type=date>' +
      '<input id=inputnumber type=number>' +
      '<input id=inputrange type=range>' +
      '<input id=inputcolor type=color>' +
      '<input id=inputcheckbox type=checkbox>' +
      '<input id=inputradio type=radio>' +
      '<input id=inputfile type=file>' +
      '<input id=inputsubmit type=submit>' +
      '<input id=inputimage type=image>' +
      '<input id=inputreset type=reset>' +
      '<input id=inputbutton type=button>' +
      '<keygen id=keygen1></keygen>' +
      '<label id=label1></label>' +
      '<meter id=meter1></meter>' +
      '<object id=object1></object>' +
      '<output id=output1></output>' +
      '<progress id=progress1></progress>' +
      '<select id=select1>' +
      '    <optgroup id=optgroup1>group1</optgroup>' +
      '    <option id=option1>option1</option>' +
      '</select>' +
      '<textarea id=textarea1></textarea>' +
      '</fieldset> </form>',
  treeSanitizer: new NullTreeSanitizer());

  FieldSetElement owner = document.getElementById('fs') as FieldSetElement;

  shouldBe(owner.elements.length, 23);
  shouldBe((owner.elements[0] as Element).id, "button1");
  shouldBe((owner.elements[1] as Element).id, "fieldset1");
  shouldBe((owner.elements[2] as Element).id, "inputhidden");
  shouldBe((owner.elements[3] as Element).id, "inputtext");
  shouldBe((owner.elements[4] as Element).id, "inputsearch");
  shouldBe((owner.elements[5] as Element).id, "inputurl");
  shouldBe((owner.elements[6] as Element).id, "inputemail");
  shouldBe((owner.elements[7] as Element).id, "inputpassword");
  shouldBe((owner.elements[8] as Element).id, "inputdate");
  shouldBe((owner.elements[9] as Element).id, "inputnumber");
  shouldBe((owner.elements[10] as Element).id, "inputrange");
  shouldBe((owner.elements[11] as Element).id, "inputcolor");
  shouldBe((owner.elements[12] as Element).id, "inputcheckbox");
  shouldBe((owner.elements[13] as Element).id, "inputradio");
  shouldBe((owner.elements[14] as Element).id, "inputfile");
  shouldBe((owner.elements[15] as Element).id, "inputsubmit");
  shouldBe((owner.elements[16] as Element).id, "inputreset");
  shouldBe((owner.elements[17] as Element).id, "inputbutton");
  shouldBe((owner.elements[18] as Element).id, "keygen1");
  shouldBe((owner.elements[19] as Element).id, "object1");
  shouldBe((owner.elements[20] as Element).id, "output1");
  shouldBe((owner.elements[21] as Element).id, "select1");
  shouldBe((owner.elements[22] as Element).id, "textarea1");

  Element newElement = document.createElement("input");
  newElement.setAttribute("type", "text");
  newElement.setAttribute("value", "new element");
  newElement.setAttribute("id", "inputcommon");

  debug("");
  debug("Check elements array is updated after adding a new element");
  owner.append(newElement); shouldBe(owner.elements.length, 24);

  debug("");
  debug("Check elements array is updated after remove an element");
  newElement.remove(); shouldBe(owner.elements.length, 23);

  debug("");
  debug("Check owner.elements is updated properly");
  (document.getElementById("inputfile") as InputElement).type="image";
  shouldBe(owner.elements.length, 22);

  debug("");
  debug("Check owner.elements is updated properly after removing from parent");
  owner.remove();
  var form = document.getElementById("formElement");
  form.append(newElement);
  //shouldBe(form.elements.length, 1); //no .elements getter in FormElement in dart
  newElement.remove();
  //shouldBe(form.elements.length, 0); //no .elements getter in FormElement in dart
  shouldBe(owner.elements.length, 22);
  owner.append(newElement);
  shouldBe(owner.elements.length, 23);
  newElement.remove();
  shouldBe(owner.elements.length, 22);
}
