// Require the input to be a nonnegative integer (x >= 0).`
// The signature `{x. i32[x] | x >= 0}` means: 
// an i32 value x such that x is greater than or equal to 0.
#[flux_rs::sig(fn(({x. i32[x] | x >= 0})))]
fn takes_nonnegative_i32(_x: i32) -> () {
  ()
}

fn test_takes_nonnegative_i32() {
  takes_nonnegative_i32(-1);
}

// Require the input to be a positive integer (x > 0).
// The signature `{x. i32[x] | x > 0}` means: 
// an i32 value x such that x is greater than 0.
//
// If this function is called with a negative number,
// it will cause a stack overflow in Rust 
// and an infinite loop in Haskell
#[flux_rs::sig(fn({x. i32[x] | x > 0}) -> String)]
pub fn log_n_times(x: i32) -> String {
  match x {
    1 => "finish".to_string(),
    n => format!("log: {:?}\n{:?}", n, log_n_times(n - 1))
  }
}

fn test_log_n_times() {
  log_n_times(0);
}

// Require the output to be the sum of the inputs.
// The signature `{z. i32[z] | z = x + y}` means: 
// an i32 value z such that z is equal to the sum of x and y.
//
// This code won't compile because our addition function
// is incorrect.
#[flux_rs::sig(fn(x: i32, y: i32) -> {z. i32[z] | z == x + y})]
pub fn addition(x: i32, y: i32) -> i32 {
  x + y + 1
}
