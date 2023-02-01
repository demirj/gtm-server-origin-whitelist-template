___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Origin Whitelist",
  "description": "Check if origin is in whitelist.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SIMPLE_TABLE",
    "name": "allowedOrigins",
    "displayName": "Allowed Origins",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "",
        "name": "value",
        "type": "TEXT",
        "valueValidators": [
          {
            "type": "REGEX",
            "args": [
              "^(https?):\\/\\/(.*)"
            ]
          }
        ]
      }
    ],
    "help": "Please add allowed origins.",
    "valueValidators": []
  }
]


___SANDBOXED_JS_FOR_SERVER___

// APIs
const getRequestHeader = require('getRequestHeader');

// Data
const origin = getRequestHeader('origin');
const allowedOrigins = data.allowedOrigins;

// Logic
if (!origin) {
  return 'No origin header found';
}

let foundOrigin;

allowedOrigins.forEach(o => {
  if (o.value === origin) {
    foundOrigin = true;
  }
});

return foundOrigin || false;


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "headerWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "origin"
                  }
                ]
              }
            ]
          }
        },
        {
          "key": "headersAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 1.2.2023, 15:39:58


