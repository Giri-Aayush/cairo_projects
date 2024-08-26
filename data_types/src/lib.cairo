fn main(){
    // This will be a u8
    let variable_1_u8: u8 = 32;
    println!("This is a u8 = {}", variable_1_u8);
    // Another wat to do the same declaration
    let variable_2_u8 = 45_u8;
    println!("This is a u8 = {}", variable_2_u8);

    // This will be a short string
    // we can have upto 31 characters
    let variable_3 = 'Hello World';
    println!("This is a short string = {}", variable_3);

    // This will autmatically take felt252 as type
    let variable_4 = 723462;
    println!("This is a felt252 = {}", variable_4);

    //This will be a boolean value
    let variable_5 = true;
    let variable_6 = false;
    println!("This is a bool = {}", variable_5);
    println!("This is a bool = {}", variable_6);

    //This will be ByteArray for longer strings
    let variable_7: ByteArray = "Aayush is a Cairo Developer";
    println!("This is a ByteArray string = {}", variable_7);

    //This will be a tuple 
    let variable_8 : (u32, bool) = (23, false);
    let variable_9 : (u32, bool, felt252, ByteArray, i8) = (23, false, 'Hello', "Hello World with ByteArray", -11);
    let (x, y): (felt252, felt252) = (2, 3);

    // println!("This is a tuple element = {}", variable_8.one);

    let arr_1: [u64;5] = [1,2,3,4,5];
    let arr2: Span<u64> = arr_1.span();
    println!("This is a span indexing element = {}", arr2[2]);





}