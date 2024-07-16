
fn main() {
    let initial_balance = 9;
    let initial_balance = initial_balance - 3;
    {
        let initial_balance = initial_balance * 2;
    }
    println!("Final balance is: {}", initial_balance);
}