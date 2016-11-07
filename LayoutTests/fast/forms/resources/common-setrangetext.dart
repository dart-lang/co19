library common_setrangetext;

import "dart:html";
import "../../../testcommon.dart";

void runTestsShouldPass(String tagName, [Map<String,String> attributes=const {}]) {
  InputElement element = document.createElement(tagName) as InputElement;
  for (String key in attributes.keys)
    element.setAttribute(key, attributes[key]);
  document.body.append(element);
  debug("<hr>");
  debug("Running tests on $tagName with attributes: $attributes");
  debug("setRangeText() with only one parameter.");

  element.value = '0123456789';
  element.setSelectionRange(2, 5);
  element.setRangeText('ABC');
  shouldBeEqualToString(element.value, "01ABC56789");
  shouldBe(element.selectionStart, 2);
  shouldBe(element.selectionEnd, 5);
  element.setRangeText('ABCD');
  shouldBeEqualToString(element.value, "01ABCD56789");
  shouldBe(element.selectionStart, 2);
  shouldBe(element.selectionEnd, 6);
  element.setRangeText('AB');
  shouldBeEqualToString(element.value, "01AB56789");
  shouldBe(element.selectionStart, 2);
  shouldBe(element.selectionEnd, 4);
  element.setRangeText('');
  shouldBeEqualToString(element.value, "0156789");
  shouldBe(element.selectionStart, 2);
  shouldBe(element.selectionEnd, 2);

  debug("setRangeText() with 'select' as the selectMode.");
  element.value = '0123456789';
  element.setSelectionRange(0, 0);
  element.setRangeText('ABC', start:2, end:5, selectionMode:'select');
  shouldBeEqualToString(element.value, "01ABC56789");
  shouldBe(element.selectionStart, 2);
  shouldBe(element.selectionEnd, 5);

  element.value = '0123456789';
  element.setSelectionRange(0, 0);
  element.setRangeText('ABC', start:5, end:10, selectionMode:'select');
  shouldBeEqualToString(element.value, "01234ABC");
  shouldBe(element.selectionStart, 5);
  shouldBe(element.selectionEnd, 8);

  element.value = '0123456789';
  element.setSelectionRange(0, 0);
  element.setRangeText('ABC', start:1, end:2, selectionMode:'select');
  shouldBeEqualToString(element.value, "0ABC23456789");
  shouldBe(element.selectionStart, 1);
  shouldBe(element.selectionEnd, 4);

  element.value = '0123456789';
  element.setSelectionRange(0, 0);
  element.setRangeText('', start:1, end:9, selectionMode:'select');
  shouldBeEqualToString(element.value, "09");
  shouldBe(element.selectionStart, 1);
  shouldBe(element.selectionEnd, 1);

  debug("setRangeText() with 'start' as the selectMode.");
  element.value = '0123456789';
  element.setSelectionRange(0, 0);
  element.setRangeText('ABC', start:2, end:6, selectionMode:'start');
  shouldBeEqualToString(element.value, "01ABC6789");
  shouldBe(element.selectionStart, 2);
  shouldBe(element.selectionEnd, 2);

  debug("setRangeText() with 'end' as the selectMode.");
  element.value = '0123456789';
  element.setSelectionRange(0, 0);
  element.setRangeText('ABC', start:10, end:10, selectionMode:'end');
  shouldBeEqualToString(element.value, "0123456789ABC");
  shouldBe(element.selectionStart, 13);
  shouldBe(element.selectionEnd, 13);

  debug("setRangeText() with 'preserve' as the selectMode.");
  element.value = '0123456789';
  element.setSelectionRange(6, 9);
  element.setRangeText('A', start:1, end:2); // selectMode is optional and defaults to preserve.
  shouldBeEqualToString(element.value, "0A23456789");
  shouldBe(element.selectionStart, 6);
  shouldBe(element.selectionEnd, 9);

  element.value = '0123456789';
  element.setSelectionRange(6, 9);
  element.setRangeText('AB', start:1, end:1, selectionMode:'invalid'); // Invalid selectMode values default to preserve.
  shouldBeEqualToString(element.value, "0AB123456789");
  shouldBe(element.selectionStart, 8);
  shouldBe(element.selectionEnd, 11);

  element.value = '0123456789';
  element.setSelectionRange(6, 9);
  element.setRangeText('A', start:1, end:3, selectionMode:'preserve');
  shouldBeEqualToString(element.value, "0A3456789");
  shouldBe(element.selectionStart, 5);
  shouldBe(element.selectionEnd, 8);

  element.value = '0123456789';
  element.setSelectionRange(2, 6);
  element.setRangeText('A', start:1, end:4, selectionMode:'preserve');
  shouldBeEqualToString(element.value, "0A456789");
  shouldBe(element.selectionStart, 1);
  shouldBe(element.selectionEnd, 4);

  element.value = '0123456789';
  element.setSelectionRange(2, 6);
  element.setRangeText('A', start:4, end:6, selectionMode:'preserve');
  shouldBeEqualToString(element.value, "0123A6789");
  shouldBe(element.selectionStart, 2);
  shouldBe(element.selectionEnd, 5);

  element.value = '0123456789';
  element.setSelectionRange(2, 6);
  element.setRangeText('ABCDEF', start:4, end:7, selectionMode:'preserve');
  shouldBeEqualToString(element.value, "0123ABCDEF789");
  shouldBe(element.selectionStart, 2);
  shouldBe(element.selectionEnd, 10);

  debug("setRangeText() with various start/end values.");
  element.value = '0123456789';
  element.setSelectionRange(0, 0);
  element.setRangeText('A', start:100, end:100, selectionMode:'select');
  shouldBeEqualToString(element.value, "0123456789A");
  shouldBe(element.selectionStart, 10);
  shouldBe(element.selectionEnd, 11);

  element.value = '0123456789';
  element.setSelectionRange(0, 0);
  element.setRangeText('A', start:8, end:100, selectionMode:'select');
  shouldBeEqualToString(element.value, "01234567A");
  shouldBe(element.selectionStart, 8);
  shouldBe(element.selectionEnd, 9);

  element.value = '0123456789';
  shouldThrow(() => element.setRangeText('A', start:7, end:3));
}

void runTestsShouldFail(String tagName, [Map<String, String> attributes=const {}]) {
  InputElement element = document.createElement(tagName) as InputElement;
  for (String key in attributes.keys)
    element.setAttribute(key, attributes[key]);

  document.body.append(element);
  debug("<hr>");
  debug("Running tests on $tagName with attributes: $attributes");
  if (element.getAttribute("type") == "file")
    shouldThrow(() => element.value = '0123456789XYZ');
  else
    element.value = '0123456789XYZ';
  String initialValue = element.value;
  shouldThrow(() => element.setRangeText('ABC', start:0, end:0));
  // setRangeText() shouldn't do anything on non-text form controls.
  shouldBeEqualToString(element.value, initialValue);
}
