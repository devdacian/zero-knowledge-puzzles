pragma circom 2.1.4;

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

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.
template Equality() {
    signal input a[3];
    signal output c; // 1 Equal, 0 False

    // a[0] == a[1] ?
    component check1 = IsEqual();
    check1.in[0] <== a[0];
    check1.in[1] <== a[1];

    // a[1] == a[2] ?
    component check2 = IsEqual();
    check2.in[0] <== a[1];
    check2.in[1] <== a[2];

    // constraint inspired by
    // https://github.com/iden3/circomlib/blob/master/circuits/gates.circom#L29-L35
    //
    // a[0] == a[1] && a[1] == a[2]
    c <== check1.out * check2.out;
}

component main = Equality();