
module.exports = {

    name: "Ubeeqo Module",

    directory: false,

    params: ["Name"],

    rules: function(config) {

      return({
        items: [
          { destinationFile: "actions.js",sourceTemplateFile: "actions.tpl.js"},
          { destinationFile: "reducers.spec.js",sourceTemplateFile: "reducers.spec.tpl.js"},
          { destinationFile: "constants.js",sourceTemplateFile: "constants.tpl.js"},
          { destinationFile: "reducers.js",sourceTemplateFile: "reducers.tpl.js"},
          { destinationFile: "selectors.js",sourceTemplateFile: "selectors.tpl.js"},
          { destinationFile: "selectors.spec.js",sourceTemplateFile: "selectors.spec.tpl.js"},
        ]
      });

    }

}
