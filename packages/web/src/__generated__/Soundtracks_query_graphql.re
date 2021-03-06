/* @generated */

module Unions = {};

module Types = {
  type node = {
    id: string,
    title: string,
    getFragmentRefs:
      unit =>
      {
        .
        "__$fragment_ref__TrackList_soundtrack": TrackList_soundtrack_graphql.t,
        "__$fragment_ref__Composer_soundtrack": Composer_soundtrack_graphql.t,
      },
  };
  type edges = {node: option(node)};
  type allSoundtracks = {edges: array(edges)};
};

open Types;

type fragment = {allSoundtracks: option(allSoundtracks)};

module Internal = {
  type fragmentRaw;
  let fragmentConverter: Js.Dict.t(Js.Dict.t(string)) = [%raw
    {| {"allSoundtracks":{"n":""},"allSoundtracks_edges_node":{"n":"","f":""}} |}
  ];
  let fragmentConverterMap = ();
  let convertFragment = v =>
    v
    ->ReasonRelay._convertObj(
        fragmentConverter,
        fragmentConverterMap,
        Js.undefined,
      );
};

type t;
type fragmentRef;
type fragmentRefSelector('a) =
  {.. "__$fragment_ref__Soundtracks_query": t} as 'a;
external getFragmentRef: fragmentRefSelector('a) => fragmentRef = "%identity";

module Utils = {};

type operationType = ReasonRelay.fragmentNode;

let node: operationType = [%bs.raw
  {| {
  "kind": "Fragment",
  "name": "Soundtracks_query",
  "type": "Query",
  "metadata": null,
  "argumentDefinitions": [],
  "selections": [
    {
      "kind": "LinkedField",
      "alias": null,
      "name": "allSoundtracks",
      "storageKey": "allSoundtracks(orderBy:\"TITLE_ASC\")",
      "args": [
        {
          "kind": "Literal",
          "name": "orderBy",
          "value": "TITLE_ASC"
        }
      ],
      "concreteType": "SoundtracksConnection",
      "plural": false,
      "selections": [
        {
          "kind": "LinkedField",
          "alias": null,
          "name": "edges",
          "storageKey": null,
          "args": null,
          "concreteType": "SoundtracksEdge",
          "plural": true,
          "selections": [
            {
              "kind": "LinkedField",
              "alias": null,
              "name": "node",
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
                  "name": "title",
                  "args": null,
                  "storageKey": null
                },
                {
                  "kind": "FragmentSpread",
                  "name": "TrackList_soundtrack",
                  "args": null
                },
                {
                  "kind": "FragmentSpread",
                  "name": "Composer_soundtrack",
                  "args": null
                }
              ]
            }
          ]
        }
      ]
    }
  ]
} |}
];
