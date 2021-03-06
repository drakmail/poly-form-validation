global.$ = global.jQuery = $ = require "jquery" unless jQuery?
require 'angular/angular' unless angular?

require 'angular-ui-utils/modules/validate/validate'
require 'angular-ui-utils/modules/mask/mask'

module.exports =
  angular.module('poly-form-validation', ['ui.validate','ui.mask'])
  .directive("formTabs",        require("./directives/form-tabs/FormTabs.coffee"))
  .directive("formTab",         require("./directives/form-tab/FormTab.coffee"))
  .directive("formGroup",       require("./directives/form-group/FormGroup.coffee"))
  .directive("inputGroup",      require("./directives/input-group/InputGroup.coffee"))
  .directive("inputGroupAddon", require("./directives/input-group-addon/InputGroupAddon.coffee"))
  .directive("errorMessage",    require("./directives/error-message/ErrorMessage.coffee"))
  .directive("validIcon",       require("./directives/valid-icon/ValidIcon.coffee"))
  .directive("loaderIcon",      require("./directives/loader-icon/LoaderIcon.coffee"))
  .directive("popover",         require("./directives/popover/Popover.coffee"))
  .directive("isEqual",         require("./directives/is-equal/IsEqual.coffee"))
  .directive("formControl", ['$parse', require("./directives/form-control/FormControl.coffee")])
  .directive("input",       ['$parse', require("./directives/defaultValue/DefaultValue.coffee")])
  .directive("select",      ['$parse', require("./directives/defaultValue/DefaultValue.coffee")])
  .directive("textarea",    ['$parse', require("./directives/defaultValue/DefaultValue.coffee")])
  .directive("disableValidationWhenHidden", require("./directives/disable-validation-when-hidden/DisableValidationWhenHidden.coffee"))
  .directive("isUnique",         ['$timeout', '$http', require("./directives/is-unique/IsUnique.coffee")])
  .directive("remoteValidation", ['$timeout', '$http', require("./directives/remote-validation/RemoteValidation.coffee")])
