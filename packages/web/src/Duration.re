let cleanFloat = value => value |> int_of_float |> string_of_int;

module LeadingZero = {
  let add = value =>
    switch (value) {
    | v when v < 10. => "0" ++ value->cleanFloat
    | _ => value->cleanFloat
    };
};

module Minutes = {
  let make = (h, s) => s /. 60.0 -. 60.0 *. h;
};

module Seconds = {
  let make = seconds =>
    (mod_float(seconds /. 60.0, 1.0) *. 60.0)->Js.Math.round->LeadingZero.add;
};

let fromString = time => {
  switch (time->Js.String2.split(":")->Belt.Array.map(Belt.Int.fromString)) {
  | [|Some(0), Some(s)|] => s
  | [|Some(m), Some(s)|] => m * 60 + s
  | [|Some(h), Some(m), Some(s)|] => h * 3600 + m * 60 + s
  | _ => 0
  };
};

let make = seconds => {
  let seconds = seconds->float_of_int;
  let h = floor(seconds /. 3600.0);

  let s = Seconds.make(seconds);
  let min = Minutes.make(h, seconds);

  switch (h, min, s) {
  | (0.0, min, s) => min->cleanFloat ++ ":" ++ s
  | (h, min, s) => h->cleanFloat ++ ":" ++ LeadingZero.add(min) ++ ":" ++ s
  };
};
