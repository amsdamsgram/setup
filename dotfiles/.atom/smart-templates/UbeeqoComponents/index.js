
module.exports = {

    name: "Ubeeqo Components",

    directory: false,

    params: ["Name"],

    rules: function(config) {

      return({
        items: [
          { destinationFile: "index.js",sourceTemplateFile: "index.tpl.js"},
          { destinationFile: "index.native.js",sourceTemplateFile: "index.native.tpl.js"},
          { destinationFile: "component.js",sourceTemplateFile: "component.tpl.js"},
          { destinationFile: "component.native.js",sourceTemplateFile: "component.native.tpl.js"},
          { destinationFile: "containerFactory.js",sourceTemplateFile: "containerFactory.tpl.js"},
          { destinationFile: "style.scss", sourceContentFile: "style.tpl.scss" }
        ]
      });

    }

}
