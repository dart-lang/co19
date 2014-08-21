/**
 * after web-platform-tests/html/semantics/forms/the-input-element/email.html
 * @assertion
 * http://www.w3.org/TR/2012/CR-html5-20121217/forms.html#e-mail-state-(type=email)
 * @description Input Email
 * tests using "element.values" extracted to email_t02.dart
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
  <input type="email" id="single_email" value="user@example.com"/>
  <input type="email" id="multiple_email" value="user1@example.com, user2@test.com" multiple/>
''';

void main() {
  document.body.appendHtml(htmlEL);

  // Regexp from http://www.w3.org/html/wg/drafts/html/master/forms.html#e-mail-state-(type=email)
  RegExp validEmailRegexp = new RegExp(r"/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/");

  test((){
    InputElement single_email=document.getElementById('single_email');
    assert_equals(single_email.type, 'email');
  }, 'email type supported on input element');
  
  test((){
    var attributes = document.getElementById('multiple_email').attributes;
    assert_equals(attributes.length, 4, "length");
    Expect.isTrue(attributes.containsKey('multiple'), "multiple");
  }, '"multiple" attribute supported for input:email element');

  // When the multiple attribute is NOT specified on the element
  var element = document.getElementsByTagName('input')[0];
  test((){
    element.value = '';
    assert_equals(element.value, '');
  }, 'User agents should allow the user to set the value to the empty string');
  
  test((){
    element.value = 'user2@example.com\u000A';
    assert_equals(element.value, 'user2@example.com');
  }, 'User agents must not allow users to insert "LF" (U+000A) character into the value');
  
  test((){
    element.value = 'user3@example.com\u000D';
    assert_equals(element.value, 'user3@example.com');
  }, 'User agents must not allow users to insert "CR" (U+000D) character into the value');
  
  test((){
    element.value = 'user4@example.com';
    assert_true(validEmailRegexp.hasMatch(element.value));
  }, 'The value attribute, if specified and not empty, must have a value that is a single valid e-mail address');
  
  test((){
    element.multiple=false;
    element.value = '  user@example.com  , user2@example.com  ';
    assert_equals(element.value, 'user@example.com');
    assert_true(  validEmailRegexp.hasMatch(element.value));
  }, 'When the multiple attribute is removed, the user agent must run the value sanitization algorithm');

  // When the mutiple attribute is specified on the element
  element = document.getElementById('multiple_email');

  test((){
      assert_equals(element.value, 'user1@example.com,user2@test.com,user3@test.com');
  }, 'Let the element\'s value be the result of concatenating all the values in latest values, separating each value from the next by a single "," (U+002C) character, maintaining the list\'s order.');

  // When the multiple attribute is set, the user agent must run the value sanitization algorithm
    element.value = '  user1@example.com  , user2@test.com, user3@test.com  ';
    
    test((){
      assert_equals(element.value, 'user1@example.com,user2@test.com,user3@test.com');
    }, 'Let the element\'s value be the result of concatenating the element\'s values, separating each value from the next by a single "," (U+002C) character, maintaining the list\'s order');

  checkTestFailures();
}
