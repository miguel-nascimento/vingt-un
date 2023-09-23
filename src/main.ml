type card = 
  value * suit
and value = 
  | Ace 
  | Two
  | Three
  | Four
  | Five
  | Six
  | Seven
  | Eight
  | Nine
  | Jack
  | Queen
  | King
and suit =
  | Spade
  | Heart
  | Diamond
  | Club

let int_of_value value =
  match value with
  | Ace -> 1
  | Two -> 2
  | Three -> 3
  | Four -> 4
  | Five -> 5
  | Six -> 6
  | Seven -> 7
  | Eight -> 8
  | Nine -> 9
  | Jack -> 10
  | Queen -> 10
  | King -> 10

let int_of_card card = int_of_value (fst card)

let value_of_int int = 
  match int with
  | 1 -> Ace
  | 2 -> Two
  | 3 -> Three
  | 4 -> Four
  | 5 -> Five
  | 6 -> Six
  | 7 -> Seven
  | 8 -> Eight
  | 9 -> Nine
  | 10 -> Jack
  | 11 -> Queen
  | 12 -> King
  | _ -> failwith "unreachable"

let suit_of_int int = 
  match int with
  | 0 -> Spade
  | 1 -> Heart
  | 2 -> Diamond
  | 3 -> Club
  | _ -> failwith "unreachable" 

let string_of_card (value, suit) = 
  let str_suit = match suit with | Spade -> "♠" | Heart -> "♥" | Diamond -> "♦" | Club -> "♣" in 
  let str_value = match value with | Ace -> "Ace" | Jack -> "Jack" | Queen -> "Queen" | King -> "King" | _ -> string_of_int (int_of_value value) in
  str_value ^ " " ^ str_suit


let random_card = fun () ->
  let _ = Random.self_init (); in
  let rng_value = (Random.int 12) + 1 in
  let rng_suit = (Random.int 4) in
  (value_of_int rng_value, suit_of_int rng_suit)
 
let main = 
  print_endline "Welcome to vingt-un!";
  print_endline "more to get more cards";
  print_endline "q to quit";
  print_newline ();

  let sum = ref 0 in

  while (!sum <= 21) do
    if !sum != 0 then Printf.printf "You currently have %d\n" !sum else ();
    let input = read_line (); in
    match input with
    | "more" -> begin
        let card = random_card () in
        let card_value = int_of_card card in
        print_endline (string_of_card card);
        sum := !sum + card_value;
        let value = !sum in
        match value with
        | value when value == 21 -> begin
            print_endline "You won! Congratz";
            exit 0
          end
        | value when value > 21 -> begin
            print_endline "sorry, explode lol";
            Printf.printf "Your card sum was %d\n" !sum;
            exit 0
          end
        | _ -> ()
      end
    | "q" -> exit 0
    | _ -> print_endline "Unknown command"
  done
