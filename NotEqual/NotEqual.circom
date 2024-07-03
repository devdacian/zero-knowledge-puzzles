pragma circom 2.1.4;

// Input : a , length of 2 .
// Output : c .
// In this exercise , you have to check that a[0] is NOT equal to a[1], if not equal, output 1, else output 0.
// You are free to use any operator you may like . 

// HINT:NEGATION

template IsZero() {
    signal input in;
    signal output out;

    signal inv;

    inv <-- in!=0 ? 1/in : 0;

    out <== -in*inv +1;
    in*out === 0;
}


template IsEqual() {
    signal input in[2];
    signal output out;

    component isz = IsZero();

    in[1] - in[0] ==> isz.in;

    isz.out ==> out;
}


template NotEqual() {
    signal input a[2];
    signal output c;

    // Your code here.
    
    // a[0] == a[1] ?
    component check1 = IsEqual();
    check1.in[0] <== a[0];
    check1.in[1] <== a[1];

    // constraint inspired by
    // https://github.com/iden3/circomlib/blob/master/circuits/gates.circom#L45-L50
    c <== 1 + check1.out - 2*check1.out;
   
}

component main = NotEqual();