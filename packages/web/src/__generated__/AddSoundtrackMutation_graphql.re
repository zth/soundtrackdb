/* @generated */

type enum_SoundtrackType = [ | `GAME | `MOVIE | `FUTURE_ADDED_VALUE__];

module Unions = {};

module Types = {
  type soundtrack = {
    id: string,
    rowId: int,
  };
  type createSoundtrack = {soundtrack: option(soundtrack)};
  type soundtrackInput = {
    rowId: option(int),
    title: string,
    imdbId: option(string),
    soundtrackType: enum_SoundtrackType,
    releaseYear: string,
    createdAt: option(string),
    updatedAt: option(string),
  };
  type createSoundtrackInput = {
    clientMutationId: option(string),
    soundtrack: soundtrackInput,
  };
};

open Types;

type response = {createSoundtrack: option(createSoundtrack)};
type variables = {input: createSoundtrackInput};

module Internal = {
  type wrapResponseRaw;
  let wrapResponseConverter: Js.Dict.t(Js.Dict.t(string)) = [%raw
    {| {"createSoundtrack":{"n":""},"createSoundtrack_soundtrack":{"n":""}} |}
  ];
  let wrapResponseConverterMap = ();
  let convertWrapResponse = v =>
    v
    ->ReasonRelay._convertObj(
        wrapResponseConverter,
        wrapResponseConverterMap,
        Js.null,
      );

  type responseRaw;
  let responseConverter: Js.Dict.t(Js.Dict.t(string)) = [%raw
    {| {"createSoundtrack":{"n":""},"createSoundtrack_soundtrack":{"n":""}} |}
  ];
  let responseConverterMap = ();
  let convertResponse = v =>
    v
    ->ReasonRelay._convertObj(
        responseConverter,
        responseConverterMap,
        Js.undefined,
      );

  let variablesConverter: Js.Dict.t(Js.Dict.t(string)) = [%raw {| {} |}];
  let variablesConverterMap = ();
  let convertVariables = v =>
    v
    ->ReasonRelay._convertObj(
        variablesConverter,
        variablesConverterMap,
        Js.undefined,
      );
};

module Utils = {};

type operationType = ReasonRelay.mutationNode;

let node: operationType = [%bs.raw
  {| (function(){
var v0 = [
  {
    "kind": "LocalArgument",
    "name": "input",
    "type": "CreateSoundtrackInput!",
    "defaultValue": null
  }
],
v1 = [
  {
    "kind": "LinkedField",
    "alias": null,
    "name": "createSoundtrack",
    "storageKey": null,
    "args": [
      {
        "kind": "Variable",
        "name": "input",
        "variableName": "input"
      }
    ],
    "concreteType": "CreateSoundtrackPayload",
    "plural": false,
    "selections": [
      {
        "kind": "LinkedField",
        "alias": null,
        "name": "soundtrack",
        "storageKey": null,
        "args": null,
        "concreteType": "Soundtrack",
        "plural": false,
        "selections": [
          {
            "kind": "ScalarField",
            "alias": null,
            "name": "id",
            "args": null,
            "storageKey": null
          },
          {
            "kind": "ScalarField",
            "alias": null,
            "name": "rowId",
            "args": null,
            "storageKey": null
          }
        ]
      }
    ]
  }
];
return {
  "kind": "Request",
  "fragment": {
    "kind": "Fragment",
    "name": "AddSoundtrackMutation",
    "type": "Mutation",
    "metadata": null,
    "argumentDefinitions": (v0/*: any*/),
    "selections": (v1/*: any*/)
  },
  "operation": {
    "kind": "Operation",
    "name": "AddSoundtrackMutation",
    "argumentDefinitions": (v0/*: any*/),
    "selections": (v1/*: any*/)
  },
  "params": {
    "operationKind": "mutation",
    "name": "AddSoundtrackMutation",
    "id": null,
    "text": "mutation AddSoundtrackMutation(\n  $input: CreateSoundtrackInput!\n) {\n  createSoundtrack(input: $input) {\n    soundtrack {\n      id\n      rowId\n    }\n  }\n}\n",
    "metadata": {}
  }
};
})() |}
];
