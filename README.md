# Description

A collection of directives for combining angular and bootstrap validation.

Demo: http://polyptychon.github.io/poly-form-validation

# Requirements

- [AngularJS](http://angularjs.org/)
- [JQuery](http://jquery.com/)
- [Bootstrap](https://github.com/twbs/bootstrap/)

## Install

You can install this package either with `npm` or with `bower`.

### npm

```shell
npm install --save polyptychon/poly-form-validation
```
Add a stylesheet to your `index.html` head:
```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/node_modules/poly-form-validation/lib/css/poly-form-validation.css">
```

Add a `<script>` to your `index.html`:

```html
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular.min.js"></script>

<script src="/node_modules/poly-form-validation/lib/js/poly-form-validation.min.js"></script>
```

Then add `poly-form-validation` as a dependency for your app:

```javascript
angular.module('myApp', ['poly-form-validation']);
```

Note that this package is in CommonJS format, so you can `require('poly-form-validation')`

### bower

```shell
bower install polyptychon/poly-form-validation
```

Add a stylesheet to your `index.html` head:
```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/bower_components/poly-form-validation/lib/css/poly-form-validation.css">
```

Add a `<script>` to your `index.html`:

```html
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular.min.js"></script>

<script src="/bower_components/poly-form-validation/lib/js/poly-form-validation.min.js"></script>
```

Then add `poly-form-validation` as a dependency for your app:

```javascript
angular.module('myApp', ['poly-form-validation']);
```

## Documentation

### Directives quick guide

| Name                                      | Type   | Description |
| :-------------------------------------    | :---:  | :----- |
| formTabs <br>`<form-tabs>`                       | E      | Use it to organize controls inside tabs.
| formTab  <br>`<form-tab tab-title="Validation">` | E      | Allow you to add tabs to a form in combination with form-tabs as a parent element. If you have more than one tab you can navigate to the next tab only when all form controls in the current tab are valid. |
| formControl <br>`<form-control>`          | E      | Group a form control with other validation elements. Copies all ng classes from nested inputs with ng-model and allow you to display validation messages with css.|
| inputGroup <br>`<input-group>`            | E      | Use it to replace bootstrap `<div class="input-group">` http://getbootstrap.com/css/#forms-inline |
| inputGroupAddon <br>`<input-group-addon>` | E      | Use it to replace bootstrap `<div class="input-group-addon">` http://getbootstrap.com/css/#forms-inline |
| validIcon <br>`<valid-icon>`              | E      | Use it to replace bootstrap `<span class="valid-icon glyphicon glyphicon-ok form-control-feedback"></span>` http://getbootstrap.com/css/#forms-control-validation |
| loaderIcon <br>`<loader-icon>`            | E      | Use it inside `<form-control>` to display a loader icon inside an input field. |
| errorMessage <br>`<error-message>`        | E      | Use it inside `<form-control>` to display error messages. You must add a class with the same name of angular validation directives. `<error-message class="ng-required">`. Error message show only when input has class `ng-dirty ng-invalid`. |
| popover <br>`<popover>message</popover>`  | E      | Use it to display bootstrap popover. http://getbootstrap.com/javascript/#popovers |
| uiValidate <br>`<input ui-validate=" '$value==myForm.value'">`                         | A      | Use it to validate input with expression. http://angular-ui.github.io/ui-utils/ |
| remoteValidation <br>`<input remote-validation= "remoteValidation.json">`              | A      | Use it to async validate input fields. In remote script you must return true if value is valid or error message|
| disableValidationWhenHidden <br>`<div ng-show="false" disable-validation-when-hidden>` | A      | Disable nested form controls from validation and submission when hidden with angular directives `ng-show` `ng-hide` `ng-disabled`|

### formTabs

Use it to organize controls into tabs.

##### Attributes

| Name                                      | Type   | Default | Description |
| :-------------------------------------    | :---   | :-----  | :-----      |
| select-form-tab-index                     | Number | 0       | allow you to change selected tab |

##### Example

```html
<form name="ValidationForm">
  <form-tabs>
    <form-tab tab-title="Validation">
      <div class="row">
        <form-control class="col-md-6">
          <label for="validatePassword0">password</label>
          <input name="validatePassword" id="validatePassword0" ng-model="ValidationForm.validatePasswordValue" autocomplete="validatePassword" type="password" placeholder="password" value="test" ng-required="true" class="form-control">
          <valid-icon></valid-icon>
          <loader-icon></loader-icon>
          <error-message class="ng-required">Field is required</error-message>
        </form-control>
      </div>
    </form-tab>
  </form-tabs>
</form>
```


### formTab

Allow you to add tabs to a form in combination with form-tabs as a parent element. If you have more than one tab you can navigate to the next tab only when all form controls in the current tab are valid.

##### Attributes

| Name                                      | Type    | Default   | Description |
| :-------------------------------------    | :---    | :-----    | :-----      |
| tab-title                                 | String  | 'Title'   | Set the tab title label. |
| next-tab-button-label                     | String  | 'Next'    | Set next button label. |
| show-next-button                          | Boolean | true      | Show/hide next tab button. |
| directive-scope                           | String  | undefined | Get directive controller in a variable |

##### Directive scope methods and properties

| Name                      | type        | Description |
| :-------------------------| :-----      | :-----      |
| isPaneInvalid             | property    | Return if tab is invalid. |
| selectNextPane            | method      | Selects next tab. |

##### Example

```html
<form name="ValidationForm">
  <form-tabs>
    <form-tab tab-title="Register">
      <div class="row">
        <form-control class="col-md-6">
          <label for="validatePassword0">password</label>
          <input name="validatePassword" id="validatePassword0" ng-model="ValidationForm.validatePasswordValue" autocomplete="validatePassword" type="password" placeholder="password" value="test" ng-required="true" class="form-control">
          <valid-icon></valid-icon>
          <loader-icon></loader-icon>
          <error-message class="ng-required">Field is required</error-message>
        </form-control>
      </div>
    </form-tab>
    <form-tab tab-title="User">
      <div class="row">
        <form-control class="col-md-6">
          <label for="uiValidate1">ui-validate</label>
          <input name="uiValidate" id="uiValidate1" ng-model="uiValidate1" autocomplete="uiValidate" type="password" placeholder="ui-validate" value="test" ui-validate="'$value==ValidationForm.validatePasswordValue'" ui-validate-watch="'ValidationForm.validatePasswordValue'" ng-required="true" class="form-control">
          <valid-icon></valid-icon>
          <loader-icon></loader-icon>
          <error-message class="ng-required">Field is required</error-message>
          <error-message class="ui-validate">Validation failed</error-message>
        </form-control>
      </div>
    </form-tab>
  </form-tabs>
</form>
```

##### Example with directive scope

```html
<form name="ValidationForm">
  <form-tabs>
    <form-tab tab-title="Register" directive-scope="$formTab">
      <div class="row">
        <form-control class="col-md-6">
          <label for="validatePassword0">password</label>
          <input name="validatePassword" id="validatePassword0" ng-model="ValidationForm.validatePasswordValue" autocomplete="validatePassword" type="password" placeholder="password" value="test" ng-required="true" class="form-control">
          <valid-icon></valid-icon>
          <loader-icon></loader-icon>
          <error-message class="ng-required">Field is required</error-message>
        </form-control>
        <div class="col-md-12">
          <button class="btn btn-primary"
            ng-disabled="$formTab.isPaneInValid"
            ng-click="$formTab.selectNextPane()">Next</button>
        </div>
      </div>
    </form-tab>
    <form-tab tab-title="User">
      <div class="row">
        <form-control class="col-md-6">
          <label for="uiValidate1">ui-validate</label>
          <input name="uiValidate" id="uiValidate1" ng-model="uiValidate1" autocomplete="uiValidate" type="password" placeholder="ui-validate" value="test" ui-validate="'$value==ValidationForm.validatePasswordValue'" ui-validate-watch="'ValidationForm.validatePasswordValue'" ng-required="true" class="form-control">
          <valid-icon></valid-icon>
          <loader-icon></loader-icon>
          <error-message class="ng-required">Field is required</error-message>
          <error-message class="ui-validate">Validation failed</error-message>
        </form-control>
      </div>
    </form-tab>
  </form-tabs>
</form>
```

### formControl

Group a form control with other validation elements. Copies all ng classes from nested inputs with ng-model and allow you to display validation messages with css.

##### Attributes

| Name    | Type   | Default | Description |
| :-------| :---   | :-----  | :-----      |
| type    | String | 'form-group' | Sets element class. |

##### Example

```html
<form name="ValidationForm">
  <div class="row">
    <form-control class="col-md-6">
      <label for="validatePassword0">password</label>
      <input name="validatePassword" id="validatePassword0" ng-model="ValidationForm.validatePasswordValue" autocomplete="validatePassword" type="password" placeholder="password" value="test" ng-required="true" class="form-control">
      <valid-icon></valid-icon>
      <loader-icon></loader-icon>
      <error-message class="ng-required">Field is required</error-message>
    </form-control>
  </div>
</form>
```

### errorMessages

Use it inside `<form-control>` to display error messages. You must add a class with the same name of angular validation directives. `<error-message class="ng-required">`. Error message show only when input has class `ng-dirty ng-invalid`.

| Classes           |  Provider   |
| :---------------- | :---------  |
| ng-required       | Angular     |
| ng-minlength      | Angular     |
| ng-maxlength      | Angular     |
| ng-pattern        | Angular     |
| ng-email          | Angular     |
| ng-number         | Angular     |
| ng-url            | Angular     |
| ui-validate       | Angular-ui  |
| remote-validation | Polyptychon |

You can add custom validation classes.

##### Example

```css
.has-feedback.ng-dirty.ng-invalid-custom-validation > .custom-validation,
  display: block;
}
```


### popover

Use it to display bootstrap popover. http://getbootstrap.com/javascript/#popovers

##### Attributes

| Name      | Type    | Default | Description |
| :-------  | :---   | :-----  | :-----      |
| prevent-close-on-popover-click | Boolean | false | Prevents popover to close when clicked inside |
| title     | String  | ''      | Sets popover title. |
| animation | Boolean | 'true'  | Apply a CSS fade transition to the popover |
| container | String  | null    | Appends the popover to a specific element. Example: container: 'body'. This option is particularly useful in that it allows you to position the popover in the flow of the document near the triggering element - which will prevent the popover from floating away from the triggering element during a window resize. |
| placement | String  | 'top'   | Sets popover title. |
| delay     | Number  | 0       | Delay showing and hiding the popover (ms) - does not apply to manual trigger type. If a number is supplied, delay is applied to both hide/show. Object structure is: delay: `{ "show": 500, "hide": 100 }` |
| trigger   | String  | 'focus' | How popover is triggered - `click | hover | focus | manual`. You may pass multiple triggers; separate them with a space. |
| viewport  | Object  | {selector: 'body', padding: 0} | Keeps the popover within the bounds of this element. Example: viewport: `'#viewport'` or `{ "selector": "#viewport", "padding": 0 }` |

##### Example

```html
<form name="ValidationForm">
  <div class="row">
    <form-control class="col-md-6">
      <label for="validatePassword0">password</label>
      <input name="validatePassword"
             id="validatePassword0"
             ng-model="ValidationForm.validatePasswordValue"
             autocomplete="validatePassword"
             type="password"
             placeholder="password"
             value="test"
             ng-required="true"
             class="form-control">
      <popover>Please type a password</popover>
      <valid-icon></valid-icon>
      <loader-icon></loader-icon>
      <error-message class="ng-required">Field is required</error-message>
    </form-control>
  </div>
</form>
```

### remoteValidation

Use it to async validate input fields. In remote script you must return true if value is valid or error message.
Validation triggers when other validation in input are valid and after user stops typing (500 milliseconds default value)

##### Attributes

| Name                                 | Type    | Default | Description |
| :----------------------------------- | :---    | :-----  | :-----      |
| remote-validation                    | String  | ''      | A URL to validate input value |
| remote-validation-map-data           | Object  | {}      | Mapping data from an object to url. See example bellow |
| remote-validation-quiet-millis       | Number  | 500     | How much time after user stops typing to trigger validation |
| remote-validation-data-type          | String  | 'json'  | JSON or JSONP |
| remote-validation-is-valid-path      | String  | ''      | In the returned JSON object we can specify the path to validation |
| remote-validation-is-valid-test-regx | String  | null    | Test a regular expression against return value |
| remote-validation-error-message-path | String  | ''      | In the returned JSON object we can specify the path to error message |


##### Example

```html
<form name="ValidationForm">
  <div class="row">
    <form-control class="col-md-6">
      <label for="remoteValidation11">remoteValidation</label>
      <input name="remoteValidation"
             id="remoteValidation11"
             ng-model="ValidationForm.remoteValidation11"
             autocomplete="remoteValidation"
             type="text"
             placeholder="remoteValidation"
             value="test"
             remote-validation="remoteValidation.json?value=:value"
             remote-validation-map-data="{ value:ValidationForm.remoteValidation11 }"
             ng-required="true"
             class="form-control">
      <valid-icon></valid-icon>
      <loader-icon></loader-icon>
      <error-message class="ng-required">Field is required</error-message>
      <error-message class="remote-validation">Remote Error</error-message>
    </form-control>
  </div>
</form>
```

##### Example Regx

```html
<form name="ValidationForm">
  <div class="row">
    <form-control class="col-md-6">
      <label for="remoteValidation11">remoteValidation</label>
      <input name="remoteValidation"
             id="remoteValidation11"
             class="form-control"
             type="text"
             ng-model="ValidationForm.remoteValidation11"
             ng-required="true"
             remote-validation="http://isemail.info/jsonp=JSON_CALLBACK/:value"
             remote-validation-map-data="{value:ValidationForm.remoteValidation11}"
             remote-validation-data-type="jsonp"
             remote-validation-error-message-path="diagnosis"
             remote-validation-is-valid-path="diagnosis"
             remote-validation-is-valid-test-regx="/Address is valid/gi">
      <valid-icon></valid-icon>
      <loader-icon></loader-icon>
      <error-message class="ng-required">Field is required</error-message>
      <error-message class="remote-validation">Remote Error</error-message>
    </form-control>
  </div>
</form>
```

```json
{
  "address":"test@example.com",
  "diagnosis":"Couldn't find an MX record for this domain but an A-record does exist",
  "constant":"ISEMAIL_DNSWARN_NO_MX_RECORD",
  "category":"Address is valid but a DNS check was not successful",
  "categoryconstant":"ISEMAIL_DNSWARN",
  "smtp":"250 2.1.5 ok",
  "numeric":5,
  "reference":""
}
```
