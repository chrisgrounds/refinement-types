use flux_rs::*;

defs! {
  fn myFunc(x: int) -> int {
    1
  } 
}

#[flux_rs::sig(fn(x:i32{v: myFunc(v) > 0}) -> i32)]
fn head(x: i32) -> i32 {
  x
}