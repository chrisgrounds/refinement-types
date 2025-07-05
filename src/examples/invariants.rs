use flux_rs::*;

// We can encode invariants at the type level
#[refined_by(x: int)]
#[invariant(x > 0)]
struct PositiveI32 {
  #[field(i32[x])]
  val: i32
}

fn test_positive_i32() {
  PositiveI32 { val: -1 };
}
